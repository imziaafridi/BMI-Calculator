import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/data/hive_db/hive_data.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:flutter/material.dart';

part 'bmi_calculation_state.dart';

class BmiCalculationCubit extends Cubit<BmiCalculationState> {
  BmiCalculationCubit() : super(BmiCalculationInitial());

  final HiveData _hiveData = HiveData();

  void createDBase(DataModel dataModel) async {
    try {
      _hiveData.createDB(dataModel);
      List<DataModel> r = await _hiveData.readDB();
      emit(state.copyWith(r));
    } on Exception catch (e) {
      debugPrint('$e');
    }
  } //cdb

  void readDBase(DataModel dataModel) async {
    try {
      List<DataModel> r = await _hiveData.readDB();
      emit(state.copyWith(r));
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  void deleteDBase(id) async {
    try {
      await _hiveData.deleteDB(id);
      List<DataModel> r = await _hiveData.readDB();
      emit(state.copyWith(r));
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
} // end clss
