import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdsMesssageWidget extends StatelessWidget {
  const AdsMesssageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 384.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: klightGreynColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15.h,
                    width: 14.w,
                    child: SvgPicture.asset(
                      "assets/icons/contact_placeholder.svg",
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Tarek Asmed",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: kprimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FittedBox(
                        child: Icon(
                      Icons.access_time,
                      color: Color.fromRGBO(77, 77, 77, 1),
                    )),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "منذ ساعه",
                      style: GoogleFonts.tajawal(
                        color: const Color.fromRGBO(77, 77, 77, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.h,
          ),
          const Divider(
            color: kGreyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15.h,
                    width: 14.w,
                    child: SvgPicture.asset(
                      "assets/icons/3dots_meesage.svg",
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "ممكن عنوان حضرتك بعد اذنك ",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: kGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                height: 21.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    color: kgreencolor,
                    borderRadius: BorderRadius.circular(13.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "رساله جديده",
                        style: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
