import 'package:bmi_calculator/cubit/cubit_exports.dart';
import 'package:bmi_calculator/data/data_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'settings/route/route_generates.dart';
import 'utils/utils_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveData.initHiveDB();
  await initializeDateFormatting('ur_PK');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BmiCalculationCubit>(
          create: (context) => BmiCalculationCubit(),
        ),
        BlocProvider<TempCubitBMI>(
          create: (context) => TempCubitBMI(),
        ),
      ],
      child: MaterialApp(
        title: 'B M I - C A L C U L A T O R',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          navigationBarTheme: NavigationBarThemeData(
              iconTheme: const WidgetStatePropertyAll(
                  IconThemeData(color: Colors.white60)),
              labelTextStyle: WidgetStatePropertyAll(
                GoogleFonts.lato(
                  color: const Color.fromARGB(255, 176, 78, 76),
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
        home: BNav(),
        // initialRoute: RoutesName.BMI_CLC,
        onGenerateRoute: RouteGenerates.generateRoutes,
      ),
    );
  }
}
