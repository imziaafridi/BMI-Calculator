import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormater {
  static String toDateTime(int microsecondsSinceEpoch) {
    Intl.defaultLocale = const Locale('ur', 'PK').toString(); // "ur_PK"
    var dt = DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);
    var f = DateFormat(
        'y MMMM d \'at\' h:mm:s a'); // date & time with human readable formate
    return f.format(dt);
  }
}
