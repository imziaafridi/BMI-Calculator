import 'package:equatable/equatable.dart';

class TempStateBMI extends Equatable {
  TempStateBMI({
    this.weightCounter = 65,
    this.ageCounter = 10,
    this.gender,
    this.height = 160,
    this.bNavSelectedIndex = 0,
  });
  int? weightCounter;
  int? ageCounter;
  String? gender;
  double? height;
  int? bNavSelectedIndex;

  TempStateBMI copyWith({
    int? weightCounter,
    int? ageCounter,
    String? gender,
    double? height,
    int? bNavSelectedIndex,
  }) {
    return TempStateBMI(
        weightCounter: weightCounter ?? this.weightCounter,
        ageCounter: ageCounter ?? this.ageCounter,
        gender: gender ?? this.gender,
        height: height ?? this.height,
        bNavSelectedIndex: bNavSelectedIndex ?? this.bNavSelectedIndex);
  }

  @override
  List<Object?> get props => [
        weightCounter,
        ageCounter,
        gender,
        height,
        bNavSelectedIndex,
      ];
}
