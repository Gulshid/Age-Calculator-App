import 'package:age_calculator_app/Model_/age_model.dart';
import 'package:age_calculator_app/Services_/HIve_Services.dart';
import 'package:age_calculator_app/Utils_/Routes/Routes.dart';
import 'package:age_calculator_app/Utils_/Routes/Routes_name.dart';
import 'package:age_calculator_app/view_model/Age_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AgeModelAdapter());
  await HiveServices().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AgeProvider())],

          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Calculator App',
                theme: ThemeData(
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.blue),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),
                initialRoute: RoutesName.splash,
                onGenerateRoute: Routes.generate_Route,
              );
            },
          ),
        );
      },
    );
  }
}
