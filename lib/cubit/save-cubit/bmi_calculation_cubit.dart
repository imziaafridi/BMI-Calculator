import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/cubit/cubit_exports.dart';
import 'package:bmi_calculator/data/data_exports.dart';
import 'package:flutter/material.dart';

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
