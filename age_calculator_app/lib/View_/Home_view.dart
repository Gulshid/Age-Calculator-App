import 'package:age_calculator_app/view_model/Age_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final Provid = Provider.of<AgeProvider>(context);
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset( 'assets/icon/icon.png', width: 250.w, height: 220.h, fit: BoxFit.cover,),
                ),
              ),
              
              Text(
                "Your Age:~",
                style: GoogleFonts.agbalumo(fontSize: 20.sp, color: Colors.black),
              ),
        
            SizedBox(height: 30.h,),
              //Display the age
              Text(
                "Year is:  ${Provid.agedetails['year']}",
                style: GoogleFonts.agbalumo(fontSize: 25.sp, color: Colors.green),
              ),
            SizedBox(height: 30.h,),
              //Display the month
              Text(
                "Month is:  ${Provid.agedetails['month']} ",
                style: GoogleFonts.agbalumo(fontSize: 20.sp, color: Colors.purple),
              ),
            SizedBox(height: 30.h,),
              //Display the day
              Text(
                "Day is:  ${Provid.agedetails['day']}",
                style: GoogleFonts.agbalumo(fontSize: 20.sp, color: Colors.deepOrangeAccent),
              ),
            SizedBox(height: 30.h,),
              ElevatedButton(
          
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent
                ),
                onPressed: () async {
                  DateTime? PickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
          
                  if (PickedDate != null) {
                    Provid.set_date_of_Birth(PickedDate);
                  }
                },
                child: Text('Select Your DOB...', style: 
                GoogleFonts.agbalumo(fontSize: 20.sp, color: Colors.black)
                ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
