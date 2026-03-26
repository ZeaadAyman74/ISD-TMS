import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  static final DateTime today = DateTime.now();

  ///* Return ```true``` if provided date is today but after current time
  bool get isTodayAfterNow =>
      today.isToday && isAfter(DateTime(today.hour, today.minute));

  ///* Return ```true``` if provided date is today
  bool get isToday =>
      today.day == day && today.month == month && today.year == year;

  ///* Return ```true``` if provided date is before today
  bool isBeforeInDays(DateTime date) =>
      isBefore(DateTime(date.year, date.month, date.day));

  ///* Return ```true``` if provided date is Tomorrow
  bool get isTomorrow =>
      today.day + 1 == day && today.month == month && today.year == year;

  ///* Return ```true``` if provided date is after Tomorrow
  bool get isAfterTomorrow =>
      today.day + 2 == day && today.month == month && today.year == year;

  ///* Return ```true``` if provided date is After now Hours
  bool get isAfterNowHours => (hour > DateTime.now().hour ||
      (hour == DateTime.now().hour && minute > DateTime.now().minute));

  bool get isAfterNow {
    bool isTodayAfterNow = isAfterNowHours;
    return isToday ? isTodayAfterNow : isAfter(today);
  }

  bool get isInCurrentWeek => today.difference(this).inDays < 7;

  int get age => today.difference(this).inDays ~/ 365;

  int get daysLeft => difference(today).inDays;

  DateTime get dayBefore => subtract(const Duration(days: 1));

  DateTime get dayAfter => add(const Duration(days: 1));

  ///* Days left from today
  int get daysLeftFromToday => daysLeft.isNegative ? 0 : daysLeft;

  ///* Return ```true``` if provided date is in same month of the today
  bool get isSubExpired => today.compareTo(this) == 1;

  ///* Check difference between 2 dates
  int get daysDifference => today.difference(this).inDays;

  ///* Check difference between 2 dates
  int daysDifferenceInDates(DateTime date) {
    int days = difference(date).inDays;
    return days;
  }

  bool isSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  ///* Return Day Name From Date [Saturday]
  String get dayName => DateFormat('EEEE', 'ar').format(this);

  int get weekDayIndex => weekday - 1;

  ///* Return Formatted time as `String` [12:05 PM]
  String get timeFormat => DateFormat.jm('en').format(this);

  ///* Return Formatted time as `String` [12:05]
  String get hourAndMuintes => DateFormat('hh:mm').format(this);

  ///* Return Formatted time as `String` [25 July]
  String get dateMonthFormat => DateFormat.MMMMd('en').format(this);

  ///* Return Formatted Day, Month, Year name as `String` [Sunday, 19 July 2022]
  String get dayMonthYearFormat => DateFormat.yMMMEd('en').format(this);

  ///* Return Formatted Day, Month, Year name as `String` [Sunday, 19 July]
  String get dayMonthFormat => DateFormat.yMMMd('en').format(this);

  ///* Return Formatted Time ago [1 minute ago]
  // String get timeAgoFormat =>
  //     time_ago.format(this, locale: 'ar');

  ///* Return Formatted Day, Month, Year name as `String` [19 July 2022]
  String get dateDayMonthYearFormat => DateFormat.yMMMd('en').format(this);

  ///* Return Formatted Day, Month, Year name as `String` [July 2022]
  String get dateMonthYearFormat => DateFormat.yMMM('en').format(this);

  ///* Return Formatted time as `String` [25 Jul]
  String get dateMonthShortFormat => DateFormat.MMMd('en').format(this);

  ///* Return Formatted Day, Month, Year name as `String` [12:00 PM, 19 July 2022]
  String get fullDateTimeFormat =>
      DateFormat(null, 'en').add_MMMEd().add_jm().format(this);

  ///* Return Formatted Month, Year name as `String` [2025-12]
  String get graphDateFormat => DateFormat('yyyy-MM').format(this);

  ///* Return Formatted Month, Year name as `String` [10-12-2023]
  String get dmyFormat => DateFormat('y-MM-dd').format(this);

  ///* Return Formatted Month, Year name as `String` [12/02/2023]
  String get dmySlashFormat => DateFormat('dd/MM/y').format(this);

  ///* Return Formatted Day as `String` [saturday]
  String get weekDayName => DateFormat('EEEE', 'en').format(this);

  ///* Return Formatted Day as `String` [sat , mon , sun]
  String get weekDayShortName => DateFormat('EEE', 'en').format(this);

  ///* Return Formatted Month, Year name as `String` [12]
  String get monthDay => DateFormat('dd').format(this);

  ///* Return Formatted time as `String` [25/10]
  String get dayMonthSlashFormat => DateFormat('dd/MM').format(this);

  ///* Return Formatted time as `String` [2025-03-25 12:00:00.000]
  String get toTimeStampFormat =>
      DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  ///* Return Formatted time as `String` [Dec 23, 2024]
  String get dateWithMonthName => DateFormat('MMM dd, yyyy').format(this);

  //* Date uploaded to api

  // String get dateUploadedToApi => toUtc().toIso8601String();
  // String get dateUploadedToApi => toIso8601String();
  String get dateUploadedToApi => toLocal().toIso8601String();

  //* Date from TimeStamp February 13, 2025 at 8:02:02 AM UTC+2
  // String get dateFromTimeStamp => DateFormat.yMMMMd('en').add_jm().format(this);

  //* Get is Same day
  bool isAtSameDayAs(DateTime? other) {
    return year == other?.year && month == other?.month && day == other?.day;
  }
}
