import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LargeButton extends StatelessWidget {
  const LargeButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.color,
      required this.name})
      : super(key: key);
  final double height;
  final double width;
  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(32, 127, 201, 1),
              kprimaryColor,
            ],
          )),
      child: Center(
        child: Text(
          name,
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
