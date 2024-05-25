import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/bmi_calculation_cubit.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:bmi_calculator/pages/HistoryBMI/parts/expansion_tiles_body_view_bmi.dart';
import 'package:bmi_calculator/utils/widgets/tiles_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissibleOnBodyHistoryViewBMI extends StatelessWidget {
  const DismissibleOnBodyHistoryViewBMI({
    super.key,
    required this.s,
  });

  final DataModel s;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        s.dateTimeStamp!.toString(),
      ),
      direction: DismissDirection.horizontal,
      secondaryBackground: Container(),
      background: const Icon(
        CupertinoIcons.delete,
        color: AppPaints.RED_300,
      ),
      onDismissed: (direction) {
        context.read<BmiCalculationCubit>().deleteDBase(
              s.dateTimeStamp!,
            );

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TilesText(
              value:
                  "BMI ${s.resultBMI!.toStringAsFixed(1)} is deleted successfully",
            ),
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ExpansionTilesBodyHistoyViewBMI(
          s: s,
        ),
      ),
    );
  }
}
