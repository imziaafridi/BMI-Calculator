// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/const/app_paints.dart';
import 'package:bmi_calculator/cubit/bmi_calculation_cubit.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:bmi_calculator/utils/widgets/calculate_buttom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/inc-dec-cubit/bmi_inc_dec_cubit.dart';
import '../../cubit/inc-dec-cubit/bmi_inc_dec_state.dart';
import 'parts/gender_selector.dart';
import 'parts/height_slider.dart';
import 'parts/weight_and_age_selectors.dart';

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
        child: Column(
          children: [
            (mqSize.height * 0.08).ph,

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
    );
  }
}

class CalculateButtonOPeration extends StatefulWidget {
  const CalculateButtonOPeration({super.key});

  @override
  State<CalculateButtonOPeration> createState() =>
      _CalculateButtonOPerationState();
}

class _CalculateButtonOPerationState extends State<CalculateButtonOPeration> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TempCubitBMI, TempStateBMI>(
          listener: (context, state) {},
        )
      ],
      child: CalculateButton(
        onPressed: () async {
          // access states frm cubits
          final dbState = context.read<BmiCalculationCubit>();
          final tempState = context.read<TempCubitBMI>().state;
          debugPrint(
            'Calculate Button !${tempState.ageCounter}',
          );

          double? height = tempState.height;
          int? weight = tempState.weightCounter;

          // calculate BMI
          // kg / m^2
          // height to m^2
          double mSquareHeight = (height! / 100) * (height / 100);
          double resBMI = weight! / mSquareHeight;

          // assign temp data to hive model
          DataModel dataModel = DataModel()
            ..gender = tempState.gender
            ..sliderHt = tempState.height
            ..weight = tempState.weightCounter
            ..age = tempState.ageCounter
            ..resultBMI = resBMI;

          // here i will save bmi data...
          await dbState.createDBase(dataModel);

          // testing data
          debugPrint('dataModel test: ${dataModel.runtimeType}');
          debugPrint('dataModel: ${dataModel.gender}');
          debugPrint('dataModel: ${dataModel.sliderHt}');
          debugPrint('dataModel: ${dataModel.weight}');
          debugPrint('dataModel: ${dataModel.age}');
          debugPrint('dataModel: ${dataModel.resultBMI}');

          if (!mounted) {
            return;
          } else {
            Navigator.pushNamed(
              context,
              RoutesName.BMI_RES,
            );
          }
        },
      ),
    );
  }
}
