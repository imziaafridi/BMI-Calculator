import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/circular_custom_button.dart';
import 'package:bmi_calculator/utils/widgets/custom_heading_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIncDecSelector extends StatelessWidget {
  const CustomIncDecSelector({
    super.key,
    required this.title,
    required this.value,
    this.incOntap,
    this.decOntap,
  });
  final String title;
  final String value;
  final void Function()? incOntap;
  final void Function()? decOntap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppPaints.GREY_900,
        border: Border.all(color: AppPaints.GREY_900),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          8.ph,
          CustomHeadingText(text: title),
          10.ph,
          Text(
            value,
            style: GoogleFonts.roboto(
              color: AppPaints.WHITE,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularCustomButton(
                ontap: incOntap,
                icon: CupertinoIcons.plus,
              ),
              CircularCustomButton(
                ontap: decOntap,
                icon: CupertinoIcons.minus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
