import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';

class Utils {
  Utils._();
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
