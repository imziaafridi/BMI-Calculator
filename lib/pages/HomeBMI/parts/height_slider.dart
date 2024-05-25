import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/cubit_exports.dart';
import 'package:bmi_calculator/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({
    super.key,
  });

  // double slider = 0.0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TempCubitBMI, TempStateBMI>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(color: AppPaints.GREY_900),
            color: AppPaints.GREY_900,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              6.ph,
              const CustomHeadingText(
                text: 'HEIGHT',
              ),

              // replace extenion with sizedbox
              5.ph,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomHeadingText(
                    text: '${state.height!.toInt()}',
                    textSize: 30,
                    color: Colors.white,
                  ),
                  1.pw,
                  Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: const CustomHeadingText(text: 'cm')),
                ],
              ),
              5.ph,
              Slider(
                value: state.height!,
                min: 0,
                max: 250,
                divisions: 250,
                label: 'slider: ${state.height}',
                // activeColor: C,
                thumbColor: const Color.fromARGB(255, 112, 89, 79),
                activeColor: AppPaints.WHITE_70,
                onChanged: (value) {
                  context.read<TempCubitBMI>().heightCubit(value);
                  debugPrint('sliderH: ${state.height}');
                },
              )
            ],
          ),
        );
      },
    );
  }
}
