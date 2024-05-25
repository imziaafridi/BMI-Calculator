import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/inc-dec-cubit/bmi_inc_dec_state.dart';
import 'package:bmi_calculator/data/hive_db/hive_data.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:bmi_calculator/pages/bmi_result/parts/disp_result_entries_bmi.dart';
import 'package:bmi_calculator/settings/route/route_generates.dart';
import 'package:bmi_calculator/utils/functions/bmi_result_effects.dart';
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
            // bloc: TempCubitBMI(),
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

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    context.read<BmiCalculationCubit>().readDBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: 'BMI HISTORY',
          fontSize: 23.5,
        ),
        centerTitle: true,
        backgroundColor: AppPaints.GREY_400,
      ),
      backgroundColor: AppPaints.GREY_400,
      body: BlocBuilder<BmiCalculationCubit, BmiCalculationState>(
        // bloc: BmiCalculationCubit(),
        builder: (context, state) {
          if (state is BmiCalculationInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.dataModel!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 50, bottom: 10),
              child: ListView.builder(
                itemCount: state.dataModel!.length,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DataModel s = state.dataModel![index];
                  String stamp = s.dateTimeStamp.toString().substring(12, 15);

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(12),
                        ),
                    child: Dismissible(
                      key: Key(
                        s.dateTimeStamp!.toString(),
                      ),
                      direction: DismissDirection.down,
                      background: const Icon(
                        CupertinoIcons.delete,
                        color: AppPaints.RED_DARK,
                      ),
                      onDismissed: (direction) {
                        context.read<BmiCalculationCubit>().deleteDBase(
                              s.dateTimeStamp!,
                            );
                        debugPrint('stamp: ${int.parse(stamp).toString()}');
                      },
                      child: ExpansionTile(
                        expandedAlignment: Alignment.topLeft,
                        collapsedIconColor: AppPaints.WHITE_70,
                        // collapsedTextColor: AppPaints.BLACK_900,
                        childrenPadding:
                            const EdgeInsets.only(left: 15, bottom: 4),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),

                        collapsedBackgroundColor:
                            ResultEffectsBMI.getColorBMI(s.resultBMI!),
                        iconColor: AppPaints.WHITE_70,

                        backgroundColor: AppPaints.GREY_900,
                        // expansionAnimationStyle: AnimationStyle(),
                        // clipBehavior: Clip.hardEdge,
                        title: DispResultEntriesBMI(
                          title: "BMI ${s.resultBMI!.toStringAsFixed(1)} ",
                          value: ResultEffectsBMI.getLabeledBMI(s.resultBMI!),
                          sizeT: 17,
                          sizeV: 1,
                        ),
                        // expanded views
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 4),
                            child: Column(
                              children: [
                                DispResultEntriesBMI(
                                  title: 'Gender',
                                  value: s.gender ?? 'F',
                                  sizeT: 14,
                                  sizeV: 14,
                                ),
                                DispResultEntriesBMI(
                                  title: 'Weight',
                                  value: s.weight.toString() ?? '70',
                                  sizeT: 14,
                                  sizeV: 14,
                                ),
                                DispResultEntriesBMI(
                                  title: 'Height',
                                  value: s.sliderHt.toString() ?? '150',
                                  sizeT: 14,
                                  sizeV: 14,
                                ),
                                DispResultEntriesBMI(
                                  title: 'Age',
                                  value: s.age.toString() ?? '20',
                                  sizeT: 14,
                                  sizeV: 14,
                                ),
                                DispResultEntriesBMI(
                                  title: 'Date',
                                  value: s.dateTimeStamp.toString() ?? '20',
                                  sizeT: 14,
                                  sizeV: 14,
                                ),
                              ],
                            ),
                          ),

                          // ExpansionTileText(value: s.gender ?? 'F'),
                          // ExpansionTileText(value: s.gender ?? 'F'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Image.asset('assets/bmi-icons/empty-box.png'),
            );
          }
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
