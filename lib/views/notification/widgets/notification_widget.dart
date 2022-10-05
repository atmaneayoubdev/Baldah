import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    required this.message,
    required this.title,
    required this.createdAt,
  }) : super(key: key);
  final String message;
  final String title;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7.r)),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 62.h,
                width: 62.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: klightBlueColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/bell.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                message,
                style:
                    GoogleFonts.tajawal(fontSize: 14.sp, color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/colck.svg",
                color: kprimaryColor,
              ),
              Text(
                createdAt,
                style: GoogleFonts.tajawal(
                    height: 2, fontSize: 14.sp, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
