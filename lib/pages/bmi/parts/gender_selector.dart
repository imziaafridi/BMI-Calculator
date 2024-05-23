import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/functions/app_size.dart';
import 'package:flutter/material.dart';

import '../../../cubit/inc-dec-cubit/bmi_inc_dec_cubit.dart';
import '../../../cubit/inc-dec-cubit/bmi_inc_dec_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({
    super.key,
    required this.gender,
  });

  final Map<String, String> gender;

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedKey;

  @override
  Widget build(BuildContext context) {
    final appSize = AppSize(context);
    final mqSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.gender.length,
        (int index) {
          final key = widget.gender.keys.elementAt(index);
          final value = widget.gender[key];

          return BlocBuilder<TempCubitBMI, TempStateBMI>(
            builder: (context, state) {
              var s = state;
              return GestureDetector(
                onTap: () {
                  context.read<TempCubitBMI>().genderCubit(value);
                  // setState(() {
                  //   selectedKey = key;
                  // });
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
