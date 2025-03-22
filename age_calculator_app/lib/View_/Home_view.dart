import 'package:age_calculator_app/view_model/Age_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: Colors.blueGrey,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '-:Your Total Age:-',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Year:${Provid.ageModel!.age()['year']}",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Month:${Provid.ageModel!.age()['month']}",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Day:${Provid.ageModel!.age()['day']}",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    Provid.set_Date_of_birth(pickedDate);
                  }
                },

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.lightGreenAccent
                ),
                child: Text('Select The Date of Birth...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
