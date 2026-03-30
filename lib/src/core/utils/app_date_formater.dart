import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isd_tms/src/core/helpers/shared_pref/shared_pref_utils.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class AppDateFormatter {
  static DateTime textToDate(String text, {String? textFormat}) {
    try {
      return DateFormat(
        textFormat ?? "dd/MM/yyyy",
      ).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String? textTFormat(String? text, String dateFormat, [String? local]) {
    try {
      if(text==null) return null;
      final date=DateTime.parse(text);
      final DateFormat format = DateFormat(dateFormat, local);
      return format.format(date);
    } catch (_) {
      return null;
    }
  }

  static String dateToFormat(
    DateTime time,
    String dateFormat,
  ) {
    try {
      final DateFormat format = DateFormat(dateFormat);
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static String dateStringToFormat(
    String time,
    String dateFormat,
  ) {
    try {
      final DateFormat format = DateFormat(dateFormat);
      return format.format(DateTime.parse(time));
    } catch (_) {
      return time;
    }
  }

  static String dateToString(DateTime time) {
    try {
      final DateFormat format = DateFormat('dd/MM/yyyy');
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static DateTime textToTime(String text, String lang) {
    try {
      return DateFormat("hh:mm:ss", lang).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String formatTime(String text) {
    try {
      DateTime time = DateFormat("hh:mm:ss").parse(text);
      return DateFormat('hh:mm a').format(time);
    } catch (_) {
      return '';
    }
  }

  static String timeFromSeconds(int seconds) {
    int totalMinutes = seconds ~/ 60; // Convert seconds to minutes
    int hours = totalMinutes ~/ 60; // Extract hours
    int minutes = totalMinutes % 60; // Remaining minutes

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m'; // Format as "1h 20m"
    } else if (hours > 0) {
      return '${hours}h'; // Format as "1h"
    } else {
      return '${minutes}m'; // Format as "30m"
    }
  }

  static TimeOfDay stringToTimeOfDay(String text) {
    try {
      // Split the string into hours, minutes, and seconds
      List<String> parts = text.split(":");
      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);

      return TimeOfDay(hour: hours, minute: minutes);
    } catch (error) {
      return TimeOfDay.now();
    }
  }

  static DateTime formatStringToDateTime(
    String text,
  ) {
    try {
      DateTime time = DateFormat('hh:mm a').parse(text);
      return time;
    } catch (_) {
      return DateTime.now();
    }
  }

  static String timeFromTimeStamp(int timeStamp, String locale) {
    try {
      // Handle timestamps in seconds by converting to milliseconds
      if (timeStamp < 1000000000000) {
        timeStamp *= 1000; // Convert seconds to milliseconds
      }

      // Create a DateTime object
      DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp);

      // Determine the time format based on the locale
      String timeFormat = locale.startsWith('en') ? 'hh:mm a' : 'HH:mm';

      // Format the time
      return DateFormat(timeFormat, locale).format(time.toLocal());
    } catch (e) {
      // Log the error if needed
      return '';
    }
  }

  static DateTime dateFromTimeStamp(int timeStamp) {
    try {
      // Handle timestamps in seconds by converting to milliseconds
      if (timeStamp < 1000000000000) {
        timeStamp *= 1000; // Convert seconds to milliseconds
      }

      // Create a DateTime object
      DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp);

      // Format the time as 'hh:mm a'
      return time.toLocal(); // Ensure local timezone
    } catch (e) {
      // Log the error if needed
      return DateTime.now();
    }
  }

  static String dateTimeFromTimeStamp(int timeStamp,
      {String? format, String locale = 'en'}) {
    try {
      // Handle timestamps in seconds by converting to milliseconds
      if (timeStamp < 1000000000000) {
        timeStamp *= 1000; // Convert seconds to milliseconds
      }

      // Create a DateTime object
      DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp);

      // Format the time as 'hh:mm a'
      return DateFormat(
              format ?? 'dd/MM/yyyy ${timeFormatBasedOnLocale(locale)}', locale)
          .format(time.toLocal()); // Ensure local timezone
    } catch (e) {
      // Log the error if needed
      return '';
    }
  }

  static String timeFormatBasedOnLocale(String locale) {
    return locale.startsWith('en') ? 'hh:mm a' : 'HH:mm';
  }

  static Duration getDurationBetweenTwoDates(
      DateTime startDate, DateTime endDate) {
    // Calculate the difference between the two dates
    Duration duration = endDate.difference(startDate);
    return duration;
  }

  static String convert24hTo12h(String time24hStr) {
    final now = DateTime.now();
    final timeParts = time24hStr.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);

    final dateTime = DateTime(now.year, now.month, now.day, hours, minutes);

    // Format it to 12-hour with AM/PM.
    // 'h' for 1-12 hour, 'a' for AM/PM
    // If you always want "7 PM" for "19:00" and never "7:00 PM", you can adjust the format
    // or remove the minutes if they are '00'.
    final formatter = DateFormat(
        timeFormatBasedOnLocale(SharedPrefUtils.locale ?? 'en'),
        SharedPrefUtils.locale); // Use 'h:mm a' if you need minutes
    String formattedTime = formatter.format(dateTime);

    // The 'intl' package usually handles the leading zero, but let's ensure it's removed for single digits.
    // Example: "07 AM" -> "7 AM"
    if (formattedTime.startsWith('0')) {
      formattedTime = formattedTime.substring(1);
    }
    return formattedTime;
  }

  static String getTimeAgo(DateTime date, BuildContext context) {
    final DateTime now = DateTime.now();

    // Normalize 'now' to just the date part (year, month, day) for comparison
    final DateTime today = DateTime(now.year, now.month, now.day);
    // Normalize 'date' to just the date part for comparison
    final DateTime inputDateOnly = DateTime(date.year, date.month, date.day);

    // Check if the input date is the same day as today
    if (inputDateOnly.year == today.year &&
        inputDateOnly.month == today.month &&
        inputDateOnly.day == today.day) {
      // If it's today, calculate hours ago
      final Duration difference = now.difference(date);
      final int hoursAgo = difference.inHours;

      if (hoursAgo == 0) {
        // If less than an hour ago, show minutes or "just now"
        final int minutesAgo = difference.inMinutes;
        if (minutesAgo < 1) {
          return context.localization.just_now;
        } else if (minutesAgo == 1) {
          return "1 ${context.localization.minute_ago}";
        } else {
          return "$minutesAgo ${context.localization.minutes_ago}";
        }
      } else if (hoursAgo == 1) {
        return "1 ${context.localization.hour_ago}";
      } else {
        return "$hoursAgo ${context.localization.hours_ago}";
      }
    } else {
      // If it's not today, format the date
      // You can choose any format you prefer, e.g., 'dd/MM/yyyy', 'yyyy-MM-dd'
      final DateFormat formatter = DateFormat('MMM dd, yyyy');
      return formatter.format(date);
    }
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
