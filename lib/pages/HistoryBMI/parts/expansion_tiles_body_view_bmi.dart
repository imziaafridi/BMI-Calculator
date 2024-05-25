import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:bmi_calculator/pages/ResultBMI/parts/custom_divider.dart';
import 'package:bmi_calculator/pages/ResultBMI/parts/disp_result_entries_bmi.dart';
import 'package:bmi_calculator/utils/functions/bmi_result_effects.dart';
import 'package:bmi_calculator/utils/functions/date_time_formater.dart';
import 'package:bmi_calculator/utils/widgets/tiles_text.dart';
import 'package:flutter/material.dart';

class ExpansionTilesBodyHistoyViewBMI extends StatelessWidget {
  const ExpansionTilesBodyHistoyViewBMI({super.key, required this.s});
  final DataModel s;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      collapsedIconColor: AppPaints.WHITE_70,
      // collapsedTextColor: AppPaints.BLACK_900,
      childrenPadding: const EdgeInsets.only(left: 15, bottom: 4),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      collapsedBackgroundColor: ResultEffectsBMI.getColorBMI(s.resultBMI!),
      iconColor: AppPaints.WHITE_70,

      backgroundColor: AppPaints.GREY_900,
      // expansionAnimationStyle: AnimationStyle(),
      // clipBehavior: Clip.hardEdge,
      title: DispResultEntriesBMI(
        title: "BMI RESULT",
        value: s.resultBMI!.toStringAsFixed(1),
        sizeT: 16,
        sizeV: 16,
        colorV: AppPaints.WHITE_70,
      ),
      // expanded views
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 4),
          child: Column(
            children: [
              TilesText(
                value: ResultEffectsBMI.getLabeledBMI(
                  s.resultBMI!,
                ),
                size: 14,
                fColor: ResultEffectsBMI.getColorBMI(
                  s.resultBMI!,
                ),
                fontWeight: FontWeight.w600,
              ),
              const CustomDivider(),
              DispResultEntriesBMI(
                title: 'Gender :',
                value: s.gender ?? 'F',
                sizeT: 14,
                sizeV: 14,
              ),
              DispResultEntriesBMI(
                title: 'Weight :',
                value: s.weight.toString() ?? '70',
                sizeT: 14,
                sizeV: 14,
              ),
              DispResultEntriesBMI(
                title: 'Height :',
                value: s.sliderHt.toString() ?? '150',
                sizeT: 14,
                sizeV: 14,
              ),
              DispResultEntriesBMI(
                title: 'Age :',
                value: s.age.toString() ?? '20',
                sizeT: 14,
                sizeV: 14,
              ),
              DispResultEntriesBMI(
                title: 'DateTime :',
                value:
                    DateTimeFormater.toDateTime(s.dateTimeStamp!).toString() ??
                        '20',
                sizeT: 14,
                sizeV: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
