import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions/size_extension.dart';
import 'package:bmi_calculator/utils/functions/app_size.dart';
import 'package:flutter/material.dart';

import '../../../cubit/temp-cubit/temp_cubit_bmi.dart';
import '../../../cubit/temp-cubit/temp_state_bmi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelector extends StatelessWidget {
  GenderSelector({
    super.key,
    required this.gender,
  });

  final Map<String, String> gender;

  String? selectedKey;

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        gender.length,
        (int index) {
          final key = gender.keys.elementAt(index);
          final value = gender[key];

          return BlocBuilder<TempCubitBMI, TempStateBMI>(
            builder: (context, state) {
              var s = state;
              return GestureDetector(
                onTap: () {
                  context.read<TempCubitBMI>().genderCubit(value);

                  debugPrint('genderCubit:  ${s.gender}');
                },
                child: Container(
                  width: 150,
                  height: 150,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                      color: AppPaints.GREY_900,
                      border: Border.all(
                        color: s.gender != value
                            ? AppPaints.GREY_900
                            : AppPaints.WHITE_70,
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
                      (appSize.mQueryHt(0.02)).ph,
                      Expanded(
                        child: Text(
                          value!,
                          softWrap: false,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
