import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtensions on List<num> {
  EdgeInsets get pad {
    // assert(length <= 4, 'Length cannot be more than 4');
    // assert(length != 3, 'Length cannot be 3');
    if (length == 1) {
      return EdgeInsets.all(
        this[0].toDouble(),
      );
    } else if (length == 2) {
      return EdgeInsets.symmetric(
        horizontal: this[0].toDouble(),
        vertical: this[1].toDouble(),
      );
    } else if (length == 4) {
      return EdgeInsets.only(
        left: this[0].toDouble(),
        right: this[1].toDouble(),
        top: this[2].toDouble(),
        bottom: this[3].toDouble(),
      );
    }
    return EdgeInsets.symmetric(
      horizontal: this[0].toDouble(),
      vertical: this[1].toDouble(),
    );
  }
}

extension SizeSpacer on num {
  Widget get sbw => SizedBox(width: w);
  Widget get sbh => SizedBox(height: h);
}
