import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/cubit_exports.dart';
import 'package:bmi_calculator/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'disp_result_entries_bmi.dart';

class DispResultCardBMI extends StatelessWidget {
  const DispResultCardBMI({super.key, this.size, required this.resBMI});
  final Size? size;
  final double? resBMI;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TempCubitBMI, TempStateBMI>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 0,
          ),
          decoration: BoxDecoration(
            color: AppPaints.GREY_900,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                offset: const Offset(-6.0, -6.0),
                blurRadius: 16.0,
                // spreadRadius: 6,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(6.0, 6.0),
                blurRadius: 16.0,
                // spreadRadius: 6,
              ),
            ],
            // color: const Color(0xFF292D32),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (size!.height * 0.02).ph,
              DispResultEntriesBMI(
                title: 'GENDER',
                value: state.gender ?? 'MALE',
              ),
              (size!.height * 0.01).ph,
              // const CustomDivider(),
              (size!.height * 0.01).ph,
              DispResultEntriesBMI(
                title: 'AGE',
                value: state.ageCounter.toString(),
                // colorV: ResultEffectsBMI.getColorBMI(resBMI!),
              ),
              (size!.height * 0.01).ph,
              // const CustomDivider(),
              (size!.height * 0.01).ph,
              DispResultEntriesBMI(
                title: 'HEIGHT',
                value: state.height.toString(),
                // colorV: ResultEffectsBMI.getColorBMI(resBMI!),
              ),
              (size!.height * 0.01).ph,
              // const CustomDivider(),
              (size!.height * 0.01).ph,
              DispResultEntriesBMI(
                title: 'WEIGHT',
                value: state.weightCounter.toString(),
                // colorV: ResultEffectsBMI.getColorBMI(resBMI!),
              ),
              (size!.height * 0.01).ph,
              // const CustomDivider(),
              (size!.height * 0.01).ph,
              // DispResultEntriesBMI(
              //   title: 'RESULT',
              //   value: resBMI!.toStringAsFixed(1) ?? '21.23',
              //   colorV: ResultEffectsBMI.getColorBMI(resBMI!),
              // ),
              (size!.height * 0.02).ph,
            ],
          ),
        );
      },
    );
  }
}
