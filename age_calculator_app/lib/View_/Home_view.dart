import 'package:age_calculator_app/view_model/Age_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provid = Provider.of<AgeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                'assets/icon/icon.png',
                width: 200.w,
                height: 180.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20.h),

            // Heading
            Text(
              "Your Age Calculator",
              style: GoogleFonts.agbalumo(
                fontSize: 22.sp,
                color: Colors.teal.shade800,
              ),
            ),

            SizedBox(height: 20.h),

            // DOB TextField
            TextField(
  controller: dobController,
  readOnly: true,
  style: GoogleFonts.agbalumo(
    color: Colors.purple, // ✅ always use purple for DOB text
    fontSize: 18.sp,
  ),
  cursorColor: Colors.purple, // ✅ makes cursor purple too
  decoration: InputDecoration(
    labelText: "Select Date of Birth",
    labelStyle: GoogleFonts.agbalumo(
      color: Colors.teal, // label stays teal
      fontSize: 16.sp,
    ),
    hintStyle: GoogleFonts.agbalumo(
      color: Colors.purple.withValues(alpha: 0.5), // hint stays purple tint
    ),
    prefixIcon: Icon(Icons.cake, color: Colors.teal),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.purple, width: 2), // ✅ purple border on focus
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.teal, width: 1.5),
    ),
  ),
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(1900),
  lastDate: DateTime.now(),
  builder: (context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.blue, 
          onPrimary: Colors.white, 
          onSurface: Colors.blue,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
          ),
        ),
      ),
      child: child!,
    );
  },
);


    if (pickedDate != null) {
      dobController.text = DateFormat('dd MMM yyyy').format(pickedDate);
      Provider.of<AgeProvider>(context, listen: false)
          .set_date_of_Birth(pickedDate);
    }
  },
),

        

            SizedBox(height: 30.h),

            // Age results in cards
            _buildAgeCard(
              title: "Years",
              value: "${provid.agedetails['year']}",
              color: Colors.green,
            ),
            SizedBox(height: 15.h),
            _buildAgeCard(
              title: "Months",
              value: "${provid.agedetails['month']}",
              color: Colors.purple,
            ),
            SizedBox(height: 15.h),
            _buildAgeCard(
              title: "Days",
              value: "${provid.agedetails['day']}",
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeCard({required String title, required String value, required Color color}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$title:",
              style: GoogleFonts.agbalumo(
                fontSize: 18.sp,
                color: Colors.black87,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.agbalumo(
                fontSize: 20.sp,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

