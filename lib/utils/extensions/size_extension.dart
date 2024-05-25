import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Pad on num {
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
}

extension SizeMQuery on Size {
  Size sizeMQuery(BuildContext ctx) {
    return MediaQuery.of(ctx).size;
  }
}
