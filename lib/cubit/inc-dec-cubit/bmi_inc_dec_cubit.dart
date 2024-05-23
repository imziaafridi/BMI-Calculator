import 'package:bloc/bloc.dart';

import 'bmi_inc_dec_state.dart';

class TempCubitBMI extends Cubit<TempStateBMI> {
  TempCubitBMI() : super(TempStateBMI(weightCounter: 60, ageCounter: 10));

//  increments and decrements operations

  void incrementWeightCubit() {
    emit(
      TempStateBMI(weightCounter: state.weightCounter! + 1),
    );
  }

  void decrementWeightCubit() {
    emit(
      TempStateBMI(weightCounter: state.weightCounter! - 1),
    );
  }

  void incrementAgeCubit() {
    emit(
      TempStateBMI(ageCounter: state.ageCounter! + 1),
    );
  }

  void decrementAgeCubit() {
    emit(
      TempStateBMI(ageCounter: state.ageCounter! - 1),
    );
  }

// gender state here.

  void genderCubit(
    String key,
  ) {
    emit(
      TempStateBMI(gender: state.gender = key),
    );
  }

// height state here.

  void heightCubit(double value) {
    emit(TempStateBMI(height: state.height = value));
  }
}//class end

