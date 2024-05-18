import 'package:bmi_calculator/const/app_paints.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.gender,
  });

  final Map<String, String> gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        gender.length,
        (int index) {
          String key = gender.keys.elementAt(index);
          String value = gender.values.elementAt(index);

          return Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
                color: AppPaints.GREY_900,
                border: Border.all(
                  color: AppPaints.GREY_900,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 60,
                  child: Image.asset(
                    key,
                    color: Colors.white70,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: const BoxDecoration(
                      // border: Border.all(color: Colors.amber),
                      ),
                  child: Text(
                    value ?? 'no values',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
