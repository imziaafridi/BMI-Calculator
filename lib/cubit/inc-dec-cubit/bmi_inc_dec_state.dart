import 'package:equatable/equatable.dart';

class TempStateBMI extends Equatable {
  TempStateBMI({
    this.weightCounter = 65,
    this.ageCounter = 10,
    this.gender,
    this.height = 0.0,
  });
  int? weightCounter;
  int? ageCounter;
  String? gender;
  double? height;

  TempStateBMI copyWith({
    int? weightCounter,
    int? ageCounter,
    String? gender,
    double? height,
  }) {
    return TempStateBMI(
      weightCounter: weightCounter ?? this.weightCounter,
      ageCounter: ageCounter ?? this.ageCounter,
      gender: gender ?? this.gender,
      height: height ?? this.height,
    );
  }

  @override
  List<Object?> get props => [
        weightCounter,
        ageCounter,
        gender,
        height,
      ];
}
