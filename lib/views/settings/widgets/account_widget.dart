import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget(
      {Key? key, required this.accountNumber, required this.iban})
      : super(key: key);
  final String accountNumber;
  final String iban;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 163.h,
      width: 204.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        color: klightGreynColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/icons/bank.svg"),
          SizedBox(
            height: 9.h,
          ),
          const Divider(color: klightGreynColor, height: 1),
          SizedBox(
            height: 6.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "رقم الحساب",
                style: GoogleFonts.tajawal(
                  fontSize: 13.sp,
                  color: kprimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.5.h),
              Text(
                "56451651651651651656486565",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.tajawal(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الايبان",
                style: GoogleFonts.tajawal(
                  fontSize: 13.sp,
                  color: kprimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.5.h),
              Text(
                "56458486565",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.tajawal(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
