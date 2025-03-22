import 'package:age_calculator_app/view_model/Age_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AgeProvider>(context, listen: false).Sett_All(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              'assets/icon/icon.png',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.fill,
            ),
          ),

          Center(
            child: Text(
              'Age Calculator App',
              style: GoogleFonts.agbalumo(fontSize: 30.sp, color: Colors.black),
            ),
          ),

          SpinKitHourGlass(color: Colors.green, size: 50.sp),
        ],
      ),
    );
  }
}
