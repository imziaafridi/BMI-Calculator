import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppSize {
  AppSize(this.context);
  BuildContext context;
  double mQueryHt(double h) {
    return MediaQuery.of(context).size.height * h;
  }
}
