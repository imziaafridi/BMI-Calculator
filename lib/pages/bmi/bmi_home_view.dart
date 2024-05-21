// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:bmi_calculator/utils/widgets/calculate_buttom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'parts/gender_selector.dart';
import 'parts/height_slider.dart';
import 'parts/weight_and_age_selectors.dart';

class BodyIndexMassHomeView extends StatefulWidget {
  const BodyIndexMassHomeView({super.key});

  @override
  State<BodyIndexMassHomeView> createState() => _BodyIndexMassHomeViewState();
}

class _BodyIndexMassHomeViewState extends State<BodyIndexMassHomeView> {
  // create map for gender.
  Map<String, String> gender = {
    'assets/bmi-icons/male.png': 'MALE',
    'assets/bmi-icons/female.png': 'FEMALE',
  };
  // final gender = [
  //   'MALE',
  //   'FEMALE',
  // ];

  double slider = 0.0;

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            (mqSize.height * 0.08).ph,
            // app title
            const AppBarTitle(),
            (mqSize.height * 0.03).ph,
            GenderSelector(gender: gender),
            20.ph,
            (mqSize.height * 0.02).ph,
            // slider for picking height for bmi
            const HeightSlider(),
            20.ph,
            //create custom widgt fot  weight  and age for bmi clc
            const WeightAndAgeSelectors(),
            // create button for calculate bmi...
            (mqSize.height * 0.05).ph,
            CalculateButton(
              onPressed: () {
                debugPrint('Calculate Button !');
                Navigator.pushNamed(
                  context,
                  RoutesName.BMI_RES,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
