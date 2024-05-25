// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/cubit/bmi_calculation_cubit.dart';
import 'package:bmi_calculator/cubit/inc-dec-cubit/bmi_inc_dec_state.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:bmi_calculator/utils/extensions.dart';
import 'package:bmi_calculator/utils/widgets/app_title.dart';
import 'package:bmi_calculator/utils/widgets/calculate_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/inc-dec-cubit/bmi_inc_dec_cubit.dart';
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

class CalculateButtonOPeration extends StatelessWidget {
  const CalculateButtonOPeration({super.key});

  @override
  Widget build(BuildContext context) {
    return CalculateButton(
      onPressed: () async {
        // access states frm cubits
        final dbState = context.read<BmiCalculationCubit>();
        final tempState = context.read<TempCubitBMI>().state;

        // Validate user input

        double height =
            tempState.height!; // Guaranteed non-null due to validation
        int weight =
            tempState.weightCounter!; // Guaranteed non-null due to validation
        int age =
            tempState.ageCounter!; // Guaranteed non-null due to validation
        String gender =
            tempState.gender!; // Guaranteed non-null due to validation

        // calculate BMI
        // kg / m^2
        // height to m^2

        double mSquareHeight = (height / 100) * (height / 100);
        double resBMI = weight / mSquareHeight;
        int dateTimeStamp = DateTime.now().microsecondsSinceEpoch;

        // assign temp data to hive model

        DataModel dataModel = DataModel()
          ..gender = tempState.gender
          ..sliderHt = tempState.height
          ..weight = tempState.weightCounter
          ..age = tempState.ageCounter
          ..resultBMI = resBMI
          ..dateTimeStamp = dateTimeStamp;

        // here i will save bmi data...

        await dbState.createDBase(dataModel);

        // testing data
        debugPrint('dataModel test: ${dataModel.runtimeType}');
        debugPrint('gender: ${dataModel.gender}');
        debugPrint('slider: ${dataModel.sliderHt}');
        debugPrint('weight: ${dataModel.weight}');
        debugPrint('age: ${dataModel.age}');
        debugPrint('res: ${dataModel.resultBMI}');
        debugPrint('dateTimeStamp: ${dataModel.dateTimeStamp}');

        // Navigate to BMI result screen
        Navigator.pushNamed(context, RoutesName.BMI_RES, arguments: resBMI);
      },
    );
  }
}
