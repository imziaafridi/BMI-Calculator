import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';

class ResultEffectsBMI {
  static Color? getColorBMI(double resBMI) {
    switch (resBMI) {
      case double bmi when bmi < 18.0:
        return AppPaints.RED_300;
      case double bmi when bmi <= 25.0:
        return AppPaints.GREEN_900;
      case double bmi when bmi < 35:
        return AppPaints.YELLOW_400;
      default:
        return AppPaints.RED_600;
    }
  }

  static String getLabeledBMI(double resBMI) {
    switch (resBMI) {
      case double bmi when bmi < 18.0:
        return 'Underweight';
      case double bmi when bmi <= 25.0:
        return 'Normal Weight';
      case double bmi when bmi <= 30.0:
        return 'Overweight';
      case double bmi when bmi <= 35.0:
        return 'Class I Obasity';

      default:
        return 'Class II Obasity';
    }
  }
}
