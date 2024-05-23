import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  String? gender;

  @HiveField(1)
  double? sliderHt;

  @HiveField(2)
  int? weight;

  @HiveField(3)
  int? age;

  @HiveField(4)
  double? resultBMI;
}

// dart run build_runner build