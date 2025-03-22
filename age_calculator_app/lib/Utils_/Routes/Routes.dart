import 'package:age_calculator_app/Utils_/Routes/Routes_name.dart';
import 'package:age_calculator_app/View_/Home_view.dart';
import 'package:age_calculator_app/View_/Splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generate_Route(RouteSettings set) {
    switch (set.name) {
      case RoutesName.splash:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => SplashView(),
          );
        }

      case RoutesName.home_view:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) => HomeView(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (_) {
              return Scaffold(
                body: Center(child: Text('No Route page is found---->')),
              );
            },
          );
        }
    }
  }
}
