import 'dart:io';
import 'package:bmi_calculator/data/data_exports.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class BaseHiveData {
  // Future<void>  initHiveDB();
  Future<void> createDB(DataModel dataModel);
  Future<void> readDB();
  Future<void> deleteDB(int id);
}

class HiveData extends BaseHiveData {
  // static late HiveInterface hive;
  static late Box<DataModel> box;

// initialize db in main
  static Future<void> initHiveDB() async {
    try {
      if (!Hive.isBoxOpen('dataModels')) {
        Directory dir = await getApplicationDocumentsDirectory();
        String path = dir.path;
        Hive
          ..init(path)
          ..registerAdapter(
            DataModelAdapter(),
          );

        box = await Hive.openBox<DataModel>('dataModels');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

// store data on calculate bmi button
  @override
  Future<void> createDB(DataModel dataModel) async {
    await box.add(dataModel);
  }

// delete data on delete/slider in recent/history tab
  @override
  Future<void> deleteDB(int id) async {
    // change to id
    await box.deleteAt(id);
  }

// read data in recent/history tab
  @override
  Future<List<DataModel>> readDB() async {
    var read = box.values.toList().cast<DataModel>();
    return read;
  }
}
