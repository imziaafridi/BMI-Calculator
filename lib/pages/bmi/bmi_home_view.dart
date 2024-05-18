// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'parts/gender_selector.dart';

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

  double slider = 0.0;

  @override
  Widget build(BuildContext context) {
    final _mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            (_mqSize.height * 0.08).ph,
            // app title
            const AppTitle(),
            (_mqSize.height * 0.03).ph,

            GenderSelector(gender: gender),
            20.ph,
            Container(
              decoration: BoxDecoration(
                color: AppPaints.GREY_900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  6.ph,
                  Text(
                    'HEIGHT',
                    style: GoogleFonts.roboto(
                      color: AppPaints.WHITE_70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  6.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${slider.toInt()}',
                        style: GoogleFonts.roboto(
                          color: AppPaints.WHITE,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      1.pw,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          'cm',
                          style: GoogleFonts.roboto(
                            color: AppPaints.WHITE,
                            // fontSize: ,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: slider,
                    label: '${slider.toInt()}',
                    min: 0,
                    max: 250,
                    divisions: 250,
                    activeColor: Colors.grey[600],
                    thumbColor: Colors.brown,
                    onChanged: (double val) {
                      setState(
                        () {
                          slider = val;
                        },
                      );
                      debugPrint('slider: $slider');
                    },
                  ),
                ],
              ),
            ),

            // height
            // (_mqSize.height * 0.02).ph,
            // // slider for picking height for bmi
            // const HeightSlider(),
            // 20.ph,
            // //create custom widgt fot  weight  and age for bmi clc
            // const WeightAndAgeSelectors(),
            // // create button for calculate bmi...
            // (_mqSize.height * 0.05).ph,
            // const CalculateButton(),
          ],
        ),
      ),
    );
  }
}
