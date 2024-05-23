import 'package:bmi_calculator/data/hive_db/hive_data.dart';
import 'package:bmi_calculator/settings/route/route_generates.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bmi_calculation_cubit.dart';
import 'cubit/inc-dec-cubit/bmi_inc_dec_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveData.initHiveDB();
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
        ),
        // home: const BodyIndexMassHomeView(),
        initialRoute: RoutesName.BMI_CLC,
        onGenerateRoute: RouteGenerates.generateRoutes,
      ),
    );
  }
}
