import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/widgets/tiles_text.dart';
import 'package:flutter/material.dart';

class HeaderHistoryViewBMI extends StatelessWidget {
  const HeaderHistoryViewBMI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppPaints.GREY_900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TilesText(
        value: 'Users can see how their weight and BMI have changed over time.',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
