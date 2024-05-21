import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key, required this.text, this.size, this.color, this.fontWeight});
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color ?? AppPaints.WHITE_70,
        fontSize: size ?? 20,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
