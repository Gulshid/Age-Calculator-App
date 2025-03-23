import 'package:age_calculator_app/Model_/age_model.dart';
import 'package:age_calculator_app/Services_/HIve_Services.dart';
import 'package:age_calculator_app/Utils_/Routes/Routes_name.dart';
import 'package:flutter/widgets.dart';

class AgeProvider with ChangeNotifier {
  //Make Provider for Splash Screen
  bool is_Splash = false;
  bool get isSplash => is_Splash;

  //set the value of splash
  void set_splash(bool value) {
    is_Splash = value;
    notifyListeners();
  }

  //function for hold splash scren in 3 seconds
  void splash(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RoutesName.home_view);
    });
  }

  //function for set all funcion
  void Sett_All(BuildContext context) {
    set_splash(true);
    splash(context);
    set_splash(false);
  }

  //Make Provider for home Screen View
  HiveServices _hiveServices = HiveServices();
  AgeModel? _ageModel;

  AgeModel? get agemodel => _ageModel;

  //function for load the data
  void load_data() async {
    _ageModel = await _hiveServices.getAge();
    notifyListeners();
  }

  //function for Set the Date of birth
  void set_date_of_Birth(DateTime Dob) async {
    _ageModel = AgeModel(date_of_Birth: Dob);
    await _hiveServices.Save_Age(_ageModel!);
    notifyListeners();
  }

  //Maping the data
  Map<String, int> get agedetails => _ageModel?.age()??{'year':0, 'month': 0, 'day':0};
}
