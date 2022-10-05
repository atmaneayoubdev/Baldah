import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget(
      {Key? key,
      required this.createdAt,
      required this.name,
      required this.message,
      required this.title,
      required this.city,
      required this.category})
      : super(key: key);
  final String createdAt;
  final String name;
  final String message;
  final String title;
  final String city;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 384.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 21.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          title,
                          style: GoogleFonts.tajawal(
                            fontSize: 14.sp,
                            color: kprimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 21.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(34, 76, 92, 145),
                        borderRadius: BorderRadius.circular(13.r)),
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
                        FittedBox(
                          child: Text(
                            createdAt,
                            style: GoogleFonts.tajawal(
                              color: const Color.fromRGBO(77, 77, 77, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.5.h),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/man.svg"),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.tajawal(
                      color: kprimaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 42.w,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/location.svg"),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    city,
                    style: GoogleFonts.tajawal(
                      color: kprimaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 42.w,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/car.svg"),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    category,
                    style: GoogleFonts.tajawal(
                      color: kprimaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          const Divider(
            color: kGreyColor,
          ),
          SizedBox(
            height: 25.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: SvgPicture.asset("assets/icons/messages.svg"),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        flex: 8,
                        child: FittedBox(
                          child: Text(
                            message,
                            style: GoogleFonts.tajawal(
                              color: kGreyColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                // Expanded(
                //   flex: 3,
                //   child: Container(
                //     height: 21.h,
                //     //width: 49.w,
                //     padding: EdgeInsets.symmetric(horizontal: 10.w),
                //     decoration: BoxDecoration(
                //         color: const Color.fromRGBO(64, 172, 66, 1),
                //         borderRadius: BorderRadius.circular(13.r)),
                //     child: Center(
                //       child: FittedBox(
                //         child: Text(
                //           "رساله جديده",
                //           textAlign: TextAlign.center,
                //           style: GoogleFonts.tajawal(
                //             fontSize: 14.sp,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
