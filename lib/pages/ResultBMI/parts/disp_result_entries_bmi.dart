import 'package:bmi_calculator/utils/widgets/body_text.dart';
import 'package:flutter/material.dart';

class DispResultEntriesBMI extends StatelessWidget {
  DispResultEntriesBMI({
    super.key,
    //main items
    required this.title,
    required this.value,
    //value props
    this.colorV,
    this.fontWhtV,
    this.sizeV,
    //title props
    this.colorT,
    this.fontWhtT,
    this.sizeT,
    this.bmiRes,
  });

  //main items
  String title;
  String value;

//value props
  final Color? colorV;
  final double? sizeV;
  final FontWeight? fontWhtV;

  //title props
  final Color? colorT;
  final double? sizeT;
  final FontWeight? fontWhtT;

  //bmi res val
  final double? bmiRes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyText(
          text: title,
          color: colorT,
          fontWeight: fontWhtT,
          size: sizeT,
        ),
        BodyText(
          text: value,
          color: colorV ?? const Color.fromARGB(233, 255, 255, 255),
          fontWeight: fontWhtV ?? FontWeight.w600,
          size: sizeV,
        ),
      ],
    );
  }
}
