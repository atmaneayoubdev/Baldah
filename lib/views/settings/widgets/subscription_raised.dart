import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionRaised extends StatelessWidget {
  const SubscriptionRaised({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(31.r),
          topRight: Radius.circular(31.r),
        ),
      ),
      height: 430.h,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset("assets/icons/top_bar.svg"),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/icons/rasied_sub.svg"),
              Text(
                "تم الاشتراك بالعضويه المدفوعه بنجاح",
                style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
          SvgPicture.asset("assets/icons/bottom_bar.svg"),
        ],
      ),
    );
  }
}
