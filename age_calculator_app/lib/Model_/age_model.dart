import 'package:hive/hive.dart';
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

    //for month adjusting if negative
    if (month < 0) {
      year--;
      month += 12;
    }
    //for day adjusting if negative
    if (day < 0) {
      month--;
      DateTime lastMonthDate = DateTime(today.year, today.month, 0);
      day += lastMonthDate.day;
    }

    return {'year': year, 'month': month, 'day': day};
  }
}
