// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:bmi_calculator/pages/pages_exports.dart';
import 'package:bmi_calculator/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'parts/functions/calculate_button_operation.dart';

class BodyIndexMassHomeView extends StatelessWidget {
  BodyIndexMassHomeView({super.key});

  // create map for gender.
  Map<String, String> gender = {
    'assets/bmi-icons/male.png': 'MALE',
    'assets/bmi-icons/female.png': 'FEMALE',
  };

  // final gender = [
  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              (mqSize.height * 0.056).ph,

              // app title
              const AppBarTitle(),

              (mqSize.height * 0.03).ph,

              GenderSelector(gender: gender),

              (mqSize.height * 0.02).ph,

              // slider for picking height for bmi
              const HeightSlider(),

              (mqSize.height * 0.02).ph,

              //create custom widgt fot  weight  and age for bmi clc
              const WeightAndAgeSelectors(),

              (mqSize.height * 0.05).ph,

              // create button for calculate bmi...
              const CalculateButtonOPeration(),
            ],
          ),
        ),
      ),
    );
  }
}
