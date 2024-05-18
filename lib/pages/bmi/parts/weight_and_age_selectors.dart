import 'package:bmi_calculator/utils/custom_selector.dart';
import 'package:flutter/material.dart';

class WeightAndAgeSelectors extends StatefulWidget {
  const WeightAndAgeSelectors({
    super.key,
    this.tapIncrement,
    this.tapDecrement,
  });
  final Function()? tapIncrement;
  final Function()? tapDecrement;

  @override
  State<WeightAndAgeSelectors> createState() => _WeightAndAgeSelectorsState();
}

class _WeightAndAgeSelectorsState extends State<WeightAndAgeSelectors> {
  int weightCounter = 60;
  int ageCounter = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSelector(
          title: 'WEIGHT',
          value: '$weightCounter',
          incOntap: () {
            setState(() {
              weightCounter++;
            });
            debugPrint('increment: $weightCounter');
          },
          decOntap: () {
            setState(() {
              weightCounter--;
            });
            debugPrint('decrement: $weightCounter');
          },
        ),
        CustomSelector(
          title: 'AGE',
          value: '$ageCounter',
          incOntap: () {
            setState(() {
              ageCounter++;
            });
            debugPrint('increment: $ageCounter');
          },
          decOntap: () {
            setState(() {
              ageCounter--;
            });
            debugPrint('increment: $ageCounter');
          },
        ),
      ],
    );
  }
}
