import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension StringExtension on String? {
  String capitalize() {
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  bool get isNullOrEmpty => !(this != null && this!.isNotEmpty);
}

extension UIExtension on num {
  ///* Return [BorderRadius] for widget
  BorderRadius get br => BorderRadius.circular(toDouble().r);

  ///* Return [Radius] for widget
  Radius get rBr => Radius.circular(toDouble());

  ///* Subtract date
  DateTime get sDate => DateTime.now().subtract(Duration(days: toInt()));

  ///* Subtract date
  DateTime get aDate => DateTime.now().add(Duration(days: toInt()));

  double toPrecision(int fractionDigits) {
    double mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}

//******************************************************************************
extension TextExtention on TextEditingController {
  ///* Return `String` after trim text from controller
  String get trimText => text.trim();

  ///* Return `int` from controller text
  int toInt() => int.tryParse(text) ?? 0;

  ///* Return `double` from controller text
  double toDouble() => double.tryParse(text) ?? 0;
}

//******************************************************************************

///* Print in log shortcuts `log()`
printMeLog(dynamic data) {
  if (kDebugMode) {
    dev.log(data.toString(), time: DateTime.now());
  }
}

//******************************************************************************
///* Print shortcuts `print()`
printMe(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
}
