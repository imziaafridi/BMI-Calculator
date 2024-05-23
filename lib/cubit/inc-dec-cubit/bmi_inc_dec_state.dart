class TempStateBMI {
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

  TempStateBMI copyWith(
    int? weightCounter,
    int? ageCounter,
  ) {
    return TempStateBMI(
      weightCounter: weightCounter ?? this.weightCounter,
      ageCounter: ageCounter ?? this.ageCounter,
    );
  }
}
