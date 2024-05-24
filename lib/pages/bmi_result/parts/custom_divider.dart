import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.thickness,
    this.color,
  });
  final double? thickness;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppPaints.WHITE_70,
      thickness: thickness ?? .3,
    );
  }
}
