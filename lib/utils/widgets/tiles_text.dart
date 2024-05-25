import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TilesText extends StatelessWidget {
  const TilesText({
    super.key,
    required this.value,
    this.fontWeight,
    this.size,
    this.fColor,
  });
  final String value;
  final FontWeight? fontWeight;
  final double? size;
  final Color? fColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: GoogleFonts.lato(
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: size ?? 16.0,
        color: fColor ?? AppPaints.WHITE_70,
      ),
    );
  }
}
