import 'package:hive_flutter/hive_flutter.dart';
part 'age_model.g.dart';

@HiveType(typeId: 0)
class AgeModel {
  @HiveField(0)
  final DateTime date_of_Birth;

  AgeModel({required this.date_of_Birth});

  Map<String, int> age() {
    final today = DateTime.now();
    int year = today.year - date_of_Birth.year;
    int month = today.month - date_of_Birth.month;
    int day = today.day - date_of_Birth.day;
    //if the month is negative
    if (month < 0) {
      year--;
      month += 12;
    }

    if (day < 0) {
      month--;
      DateTime LastMonthDate = DateTime(today.year, today.month, 0);
      day += LastMonthDate.day;
    }

    return {'year': year, 'month': month, 'day': day};
  }
}
