// ignore_for_file: use_build_context_synchronously
import 'package:bmi_calculator/cubit/cubit_exports.dart';
import 'package:bmi_calculator/data/data_exports.dart';
import 'package:bmi_calculator/settings/route/routes_name.dart';
import 'package:bmi_calculator/utils/utils_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateButtonOPeration extends StatelessWidget {
  const CalculateButtonOPeration({super.key});

  @override
  Widget build(BuildContext context) {
    return CalculateButton(
      onPressed: () async {
        // access states frm cubits
        final dbState = context.read<BmiCalculationCubit>();
        final tempState = context.read<TempCubitBMI>().state;

        // variables
        double height = tempState.height!;
        int weight = tempState.weightCounter!;

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

        // Navigate to BMI result screen
        Navigator.pushNamed(context, RoutesName.BMI_RES, arguments: resBMI);

        // testing data
        debugPrint('dataModel test: ${dataModel.runtimeType}');
        debugPrint('gender: ${dataModel.gender}');
        debugPrint('slider: ${dataModel.sliderHt}');
        debugPrint('weight: ${dataModel.weight}');
        debugPrint('age: ${dataModel.age}');
        debugPrint('res: ${dataModel.resultBMI}');
        debugPrint('dateTimeStamp: ${dataModel.dateTimeStamp}');
      },
    );
  }
}
