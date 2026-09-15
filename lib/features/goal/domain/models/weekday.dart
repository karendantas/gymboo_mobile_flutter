enum Weekday { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

extension WeekdayLabel on Weekday {
  String get shortLabel => switch (this) {
    Weekday.MONDAY => 'SEG',
    Weekday.TUESDAY => 'TER',
    Weekday.WEDNESDAY => 'QUA',
    Weekday.THURSDAY => 'QUI',
    Weekday.FRIDAY => 'SEX',
    Weekday.SATURDAY => 'SÁB',
    Weekday.SUNDAY => 'DOM',
  };
}
