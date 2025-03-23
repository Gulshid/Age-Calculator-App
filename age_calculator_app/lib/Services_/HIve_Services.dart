import 'package:age_calculator_app/Model_/age_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  //The database name
  static const String BoxName = 'BoxName';

  //The function for hive database to initialize
  Future<void> init() async {
    await Hive.openBox<AgeModel>(BoxName);
  }

  //The function for data to be stored in database
  Future<void> Save_Age(AgeModel ageModel) async {
    final box = await Hive.openBox<AgeModel>(BoxName);
    box.put('Input data', ageModel);
  }

  //The function for data to be feteched from database
  Future<AgeModel?> getAge() async {
    final box = await Hive.openBox<AgeModel>(BoxName);
    return box.get('Input data');
  }
}
