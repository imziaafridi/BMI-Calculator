import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/inc-dec-cubit/bmi_inc_dec_state.dart';
import 'package:bmi_calculator/data/hive_db/hive_data.dart';
import 'package:bmi_calculator/settings/route/route_generates.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/bmi_calculation_cubit.dart';
import 'cubit/inc-dec-cubit/bmi_inc_dec_cubit.dart';
import 'pages/bmi/bmi_home_view.dart';

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
        home: const BNav(),
        // initialRoute: RoutesName.BMI_CLC,
        onGenerateRoute: RouteGenerates.generateRoutes,
      ),
    );
  }
}

class BNav extends StatefulWidget {
  const BNav({super.key});

  @override
  State<BNav> createState() => _BNavState();
}

class _BNavState extends State<BNav> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPaints.GREY_400,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(12),
            ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BlocBuilder<TempCubitBMI, TempStateBMI>(
            builder: (context, state) {
              return NavigationBar(
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                shadowColor: AppPaints.YELLOW_400,
                surfaceTintColor: Colors.indigo,
                elevation: 2,
                overlayColor: const WidgetStatePropertyAll(
                  Color.fromARGB(196, 129, 27, 25),
                ),
                backgroundColor: AppPaints.GREY_900,
                indicatorColor: const Color.fromARGB(255, 129, 27, 25),
                selectedIndex: state.bNavSelectedIndex ?? 0,
                onDestinationSelected: (value) {
                  context.read<TempCubitBMI>().bNavSelectedIndex(value);
                  // setState(() {
                  //   isSelected = value;
                  // });
                },
                destinations: const [
                  NavigationDestination(
                    icon: Icon(
                      CupertinoIcons.home,
                    ),
                    label: 'BMI Home',
                  ),
                  NavigationDestination(
                      icon: Icon(Icons.history), label: 'BMI Recent'),
                ],
              );
            },
          ),
        ),
      ),
      body: BlocBuilder<TempCubitBMI, TempStateBMI>(
        builder: (context, state) {
          return pages[state.bNavSelectedIndex!];
        },
      ),
    );
  }
}

List<Widget> pages = [
  BodyIndexMassHomeView(),
  const HistoryView(),
];

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'BMI History',
        ),
        centerTitle: true,
        backgroundColor: AppPaints.GREY_400,
      ),
      backgroundColor: AppPaints.GREY_400,
      body: BlocBuilder<BmiCalculationCubit, BmiCalculationState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      ),
                  child: ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    collapsedIconColor: AppPaints.WHITE_70,
                    // collapsedTextColor: AppPaints.BLACK_900,
                    childrenPadding: const EdgeInsets.only(left: 15),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    collapsedBackgroundColor:
                        const Color.fromARGB(196, 129, 27, 25),
                    iconColor: AppPaints.WHITE_70,

                    backgroundColor: AppPaints.GREY_900,
                    // expansionAnimationStyle: AnimationStyle(),
                    // clipBehavior: Clip.hardEdge,
                    title: const ExpansionTileText(
                      value: 'dsjdfuhuh',
                    ),
                    // expanded views
                    children: const [
                      ExpansionTileText(value: 'skndksn'),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ExpansionTileText extends StatelessWidget {
  const ExpansionTileText({
    super.key,
    required this.value,
    this.fontWeight,
    this.size,
    this.fColor,
  });
  final String value;
  final FontWeight? fontWeight;
  final double? size;
  final Color? fColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: GoogleFonts.lato(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 16.0,
        color: fColor ?? AppPaints.WHITE_70,
      ),
    );
  }
}
