const List<String> weekdays = <String>[
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun'
];

List<DateTime> daysRange(DateTime first, DateTime last) {
  final int daysToGenerate = last.difference(first).inDays;
  final List<DateTime> listOfDates = List<DateTime>.generate(
      daysToGenerate, (int i) => first.add(Duration(days: i)));
  return listOfDates;
}
