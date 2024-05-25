import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/temp-cubit/temp_cubit_bmi.dart';
import 'package:bmi_calculator/cubit/temp-cubit/temp_state_bmi.dart';
import 'package:bmi_calculator/settings/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BNav extends StatelessWidget {
  BNav({super.key});

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
