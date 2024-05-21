import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.title,
    this.fontSize,
  });
  final String? title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'BMI CALCULATOR',
      style: GoogleFonts.poppins(
        color: AppPaints.WHITE,
        fontSize: fontSize ?? 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
