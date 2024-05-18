import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeadingText extends StatelessWidget {
  const CustomHeadingText(
      {super.key, required this.text, this.textSize, this.color});
  final String text;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color ?? AppPaints.WHITE_70,
        fontSize: textSize ?? 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
