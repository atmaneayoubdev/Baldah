import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key, required this.text}) : super(key: key);
  static const String routeName = '/terms';
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          //height: 170.h,
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 52.h,
            bottom: 15.h,
            right: 20.w,
            left: 20.w,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(32, 127, 201, 1),
                kprimaryColor,
              ],
            ),
          ),

          child: Center(
            child: Text(
              "الشروط والاحكام",
              style: GoogleFonts.tajawal(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Text(text),
        )),
      ]),
    );
  }
}
