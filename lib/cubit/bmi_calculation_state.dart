part of 'bmi_calculation_cubit.dart';

class BmiCalculationState {
  BmiCalculationState({
    this.dataModel,
  });
  final List<DataModel>? dataModel;
  BmiCalculationState copyWith(List<DataModel>? dataModel) {
    return BmiCalculationState(dataModel: dataModel ?? this.dataModel);
  }
}

final class BmiCalculationInitial extends BmiCalculationState {
  BmiCalculationInitial();
}

final class BmiCalculationDone extends BmiCalculationState {
  BmiCalculationDone({required super.dataModel});
}
