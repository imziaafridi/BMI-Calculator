import 'package:bmi_calculator/cubit/inc-dec-cubit/bmi_inc_dec_cubit.dart';
import 'package:bmi_calculator/cubit/inc-dec-cubit/bmi_inc_dec_state.dart';
import 'package:bmi_calculator/utils/custom_inc_dec_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<TempCubitBMI, TempStateBMI>(
          builder: (context, state) {
            return CustomIncDecSelector(
              title: 'WEIGHT',
              value: '${state.weightCounter}',
              incOntap: () {
                context.read<TempCubitBMI>().incrementWeightCubit();

                debugPrint('incrementWeight: ${state.weightCounter}');
              },
              decOntap: () {
                context.read<TempCubitBMI>().decrementWeightCubit();

                debugPrint('decrementWeight: ${state.weightCounter}');
              },
            );
          },
        ),
        BlocBuilder<TempCubitBMI, TempStateBMI>(
          builder: (context, state) {
            return CustomIncDecSelector(
              title: 'AGE',
              value: '${state.ageCounter}',
              incOntap: () {
                context.read<TempCubitBMI>().incrementAgeCubit();
                debugPrint('incrementAge: $ageCounter');
              },
              decOntap: () {
                context.read<TempCubitBMI>().decrementAgeCubit();

                debugPrint('decrementAge: ${state.ageCounter}');
              },
            );
          },
        ),
      ],
    );
  }
}
