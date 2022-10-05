import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LargeButtonIcon extends StatelessWidget {
  const LargeButtonIcon({Key? key, required this.name, required this.isFinal})
      : super(key: key);
  final String name;
  final bool isFinal;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 53.h,
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.r),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(32, 127, 201, 1),
            kprimaryColor,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: GoogleFonts.tajawal(
              height: 2,
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            softWrap: true,
          ),
          if (!isFinal)
            const Icon(
              Icons.keyboard_double_arrow_left_sharp,
              color: Colors.white60,
              size: 20,
            ),
        ],
      ),
    ));
  }
}
