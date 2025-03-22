import 'package:age_calculator_app/Model_/age_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static const String boxName = 'AgeBox';

  Future<void> init() async {
    await Hive.openBox<AgeModel>(boxName);
  }

  Future<void> Save_Age(AgeModel agemodel) async {
    final box = await Hive.openBox<AgeModel>(boxName);
    await box.put('Input Age', agemodel);
  }

  Future<AgeModel?> get_Age() async {
    final box = await Hive.openBox<AgeModel>(boxName);
    return box.get('Input Age');
  }
}
