const List<String> weekdaysFull = const [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

const List<String> weekdaysShort = const [
  'Mon',
  'Tue',
  'Wed',
  'Thur',
  'Fri',
  'Sat',
  'Sun'
];

const List<String> monthsShort = const <String>[
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

const List<String> monthsFull = const <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

String getWeekdayFull(DateTime dateTime) {
  int weekdayIndex = dateTime.weekday.toInt() - 1;

  print(weekdayIndex);

  return weekdaysFull[weekdayIndex];
}

String getWeekdayShort(DateTime dateTime) {
  int weekdayIndex = dateTime.weekday.toInt() - 1;

  return weekdaysShort[weekdayIndex];
}

String getMonthFull(DateTime dateTime) {
  int monthIndex = dateTime.month.toInt() - 1;

  return monthsFull[monthIndex];
}

String getMonthShort(DateTime dateTime) {
  int monthIndex = dateTime.month.toInt() - 1;

  return monthsShort[monthIndex];
}

String getEnglishDayOfMonth(DateTime dateTime) {
  int day = dateTime.day;
  String suffix = 'th';

  if (day.toString().endsWith('1')) suffix = 'st';
  if (day.toString().endsWith('2')) suffix = 'nd';
  if (day.toString().endsWith('3')) suffix = 'rd';

  return '$day$suffix';
}
