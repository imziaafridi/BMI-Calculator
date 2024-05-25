part of 'bmi_calculation_cubit.dart';

class BmiCalculationState extends Equatable {
  const BmiCalculationState({
    this.dataModel,
  });
  final List<DataModel>? dataModel;

  BmiCalculationState copyWith(List<DataModel>? dataModel) {
    return BmiCalculationState(dataModel: dataModel ?? this.dataModel);
  }

  @override
  List<Object?> get props => [
        dataModel,
      ];
}

final class BmiCalculationInitial extends BmiCalculationState {
  const BmiCalculationInitial();
}

final class BmiCalculationDone extends BmiCalculationState {
  const BmiCalculationDone({required List<DataModel> dataModel})
      : super(dataModel: dataModel);
}
