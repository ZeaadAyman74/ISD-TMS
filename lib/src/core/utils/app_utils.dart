import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/utils/enums.dart';

class Utils {
  Utils._();

  //----------------------------------------------------------------------------
  static void showToast(
      String message,  ToastStates state) =>
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: _chooseToastColor(state),
          textColor: Colors.white,
          fontSize: 16.0);

  static Color _chooseToastColor(ToastStates state) {
    switch (state) {
      case ToastStates.error:
        return Colors.black;
      case ToastStates.success:
        return AppColors.primary;
      case ToastStates.warning:
        return Colors.amber;
    }
  }

  //----------------------------------------------------------------------------

  static void showAppBottomSheet({required BuildContext context,
    required Widget child,
    double heightFactor = 0.5}) {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        isScrollControlled:true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: 16.rBr,
            topLeft: 16.rBr,
          ),
        ),
        backgroundColor: context.themeData.scaffoldBackgroundColor,
        builder: (context) =>
            FractionallySizedBox(heightFactor: heightFactor, child: child));
  }

  //----------------------------------------------------------------------------

  static Future<void> showAdaptiveDatePicker(BuildContext context,
      {DateTime? initialDate,
        DateTime? firstDate,
        DateTime? lastDate,
        void Function(DateTime dateTime)? onChange,
        bool Function(DateTime)? selectableDayPredicate}) async {
    // initialize dates
    DateTime dateNow = DateTime.now();
    DateTime first = firstDate != null
        ? DateTime(firstDate.year, firstDate.month, firstDate.day)
        : DateTime(dateNow.year, dateNow.month, dateNow.day);
    DateTime last = lastDate != null
        ? DateTime(lastDate.year, lastDate.month, lastDate.day)
        : dateNow;
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: initialDate ?? dateNow,
      currentDate: initialDate,
      firstDate: first,
      lastDate: last,
      selectableDayPredicate: selectableDayPredicate,
      locale:const Locale("en"),
    );
    if (dateTime != null) {
      if (onChange != null) {
        onChange(dateTime);
      }
    }
  }


  // Show Material Date Picker for Android
  // if (Platform.isAndroid) {
  //   final DateTime? dateTime = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate??dateNow,
  //     currentDate: initialDate,
  //     firstDate: first,
  //     lastDate: last,
  //   );
  //   if (dateTime != null) {
  //     if (onChange != null) {
  //       onChange(dateTime);
  //     }
  //   }
  //
  //   // Show Cupertino Date Picker for iOS
  // } else {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (_) {
  //       return Container(
  //         height: 250.h,
  //         color: context.themeData.colorScheme.onSecondary,
  //         child: Column(
  //           children: [
  //             Expanded(
  //               child: CupertinoDatePicker(
  //                 initialDateTime: initialDate,
  //                 minimumDate: firstDate,
  //                 maximumDate: lastDate,
  //                 mode: CupertinoDatePickerMode.date,
  //                 onDateTimeChanged: onChange ?? (dateTime){},
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  //----------------------------------------------------------------------------

  static DateTime combineDateTimeAndTimeOfDay(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  //----------------------------------------------------------------------------

  static DateTime dateFromDateTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

}
