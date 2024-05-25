import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:equatable/equatable.dart';

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
