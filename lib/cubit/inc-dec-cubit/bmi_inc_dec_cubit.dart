import 'package:bloc/bloc.dart';

import 'bmi_inc_dec_state.dart';

class TempCubitBMI extends Cubit<TempStateBMI> {
  TempCubitBMI()
      : super(TempStateBMI(weightCounter: 60, ageCounter: 20, height: 160));

//  increments and decrements operations

  void incrementWeightCubit() {
    emit(
      state.copyWith(weightCounter: state.weightCounter! + 1),
    );
  }

  void decrementWeightCubit() {
    emit(
      state.copyWith(weightCounter: state.weightCounter! - 1),
    );
  }

  void incrementAgeCubit() {
    emit(
      state.copyWith(ageCounter: state.ageCounter! + 1),
    );
  }

  void decrementAgeCubit() {
    emit(
      state.copyWith(ageCounter: state.ageCounter! - 1),
    );
  }

// gender state here.

  Future<void> genderCubit(
    String value,
  ) async {
    emit(
      state.copyWith(
        gender: value,
      ),
    );
  }

// height state here.
  void heightCubit(double value) {
    emit(
      state.copyWith(
        height: value,
      ),
    );
  }

  // btm nav bar selected index method

  void bNavSelectedIndex(int selectedIndex) {
    emit(
      state.copyWith(bNavSelectedIndex: selectedIndex),
    );
  }
}//class end

