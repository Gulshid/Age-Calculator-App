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
  final HiveServices _hiveServices = HiveServices();
  AgeModel? _ageModel;
  bool _isloading = true;

  AgeModel? get ageModel => _ageModel;
  bool get isloading => _isloading;

  //function for load data form hive
  void AgeViewModel() {
    load_Data();
  }

  //function for load
  void load_Data() async {
    _isloading = true;
    notifyListeners();

    _ageModel = await HiveServices().get_Age();
    _isloading = false;
    notifyListeners();
  }

  //function for set date of birth
  void set_Date_of_birth(DateTime dob) async {
    _ageModel = AgeModel(date_of_Birth: dob);
    await _hiveServices.Save_Age(_ageModel!);
    notifyListeners();
  }

  Map<String, int> get agedetail =>
    _ageModel?.age() ?? {'year': 0, 'month': 0, 'day': 0};
}
