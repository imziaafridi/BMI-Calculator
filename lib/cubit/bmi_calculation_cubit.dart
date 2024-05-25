import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/data/hive_db/hive_data.dart';
import 'package:bmi_calculator/data/model/data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bmi_calculation_state.dart';

class BmiCalculationCubit extends Cubit<BmiCalculationState> {
  BmiCalculationCubit() : super(const BmiCalculationInitial());

  final HiveData _hiveData = HiveData();

  Future<void> createDBase(DataModel dataModel) async {
    try {
      await _hiveData.createDB(dataModel);
      List<DataModel> r = await _hiveData.readDB();
      emit(
        BmiCalculationDone(dataModel: r),
      );
    } on Exception catch (e) {
      debugPrint('$e');
    }
  } //cdb

  void readDBase() async {
    try {
      List<DataModel> r = await _hiveData.readDB();
      emit(
        BmiCalculationDone(dataModel: r),
      );
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  void deleteDBase(int id) async {
    try {
      int index =
          state.dataModel!.indexWhere((item) => item.dateTimeStamp == id);

      if (index != -1) {
        await _hiveData.deleteDB(index);
      }
      List<DataModel> r = await _hiveData.readDB();
      emit(
        BmiCalculationDone(dataModel: r),
      );
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }
} // end clss
