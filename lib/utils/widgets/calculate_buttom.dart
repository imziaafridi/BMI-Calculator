import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Calculate Button !');
      },
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 129, 27, 25),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'CALCULATE',
          style: GoogleFonts.poppins(
            color: AppPaints.WHITE_70,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
