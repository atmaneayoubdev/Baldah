import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.name, required this.svg})
      : super(key: key);
  final String name;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: const Color.fromRGBO(32, 87, 166, 0.04),
                    shape: BoxShape.rectangle),
                child: Center(
                  child: SvgPicture.asset(
                    svg,
                    color: kprimaryColor,
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                name,
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
