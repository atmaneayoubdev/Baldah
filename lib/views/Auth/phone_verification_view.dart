import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({Key? key}) : super(key: key);
  static const String routeName = '/phone_verification';

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 129.h),
                Container(
                  margin: EdgeInsets.only(left: 45.w),
                  child: SvgPicture.asset("assets/images/lock.svg"),
                ),
                SizedBox(height: 56.h),
                SizedBox(
                  width: 275.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("كود التحقق",
                            style: GoogleFonts.tajawal(
                                fontSize: 26.sp, color: kprimaryColor)),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          "تم ارسال كود التفعيل عبر رساله نصيه هلي رقم هاتفك 96654432234",
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: Colors.grey.shade400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 59.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 41.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    Container(
                      width: 41.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    Container(
                      width: 41.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                    Container(
                      width: 41.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 37.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "إعادة ارسال الكود",
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kprimaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "59:00",
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 270.h, left: 77.w, right: 253),
              child: SvgPicture.asset("assets/images/code.svg")),
        ],
      ),
    );
  }
}
