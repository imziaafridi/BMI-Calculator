import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions/size_extension.dart';
import 'package:bmi_calculator/utils/widgets/body_text.dart';
import 'package:flutter/material.dart';

class IndicatorsBMI extends StatelessWidget {
  const IndicatorsBMI({
    super.key,
    this.mqSize,
    required this.text,
    this.colorC,
    this.colorT,
  });

  final Size? mqSize;
  final String text;
  final Color? colorT;
  final Color? colorC;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // color indicator
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: colorC ?? AppPaints.GREEN_900,
            shape: BoxShape.circle,
          ),
        ),

        (mqSize!.width * 0.02).pw,

        // text for indiacator
        BodyText(
          text: text,
          size: 14,
          color: colorT ?? AppPaints.GREEN_900,
        ),
      ],
    );
  }
}
