import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/bmi_calculation_cubit.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:bmi_calculator/pages/HistoryBMI/parts/dismissible_on_body_history_view_bmi.dart';
import 'package:bmi_calculator/pages/HistoryBMI/parts/header_history_view_bmi.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryViewBMI extends StatefulWidget {
  const HistoryViewBMI({super.key});

  @override
  State<HistoryViewBMI> createState() => _HistoryViewBMIState();
}

class _HistoryViewBMIState extends State<HistoryViewBMI> {
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
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                children: [
                  const HeaderHistoryViewBMI(),
                  30.ph,
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.dataModel!.length,
                      // reverse: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        DataModel s = state.dataModel![index];
                        return DismissibleOnBodyHistoryViewBMI(s: s);
                      },
                    ),
                  ),
                ],
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
