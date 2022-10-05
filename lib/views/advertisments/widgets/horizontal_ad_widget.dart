import 'package:flutter/material.dart';
import 'package:balda/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HorizontalAdWidget extends StatelessWidget {
  const HorizontalAdWidget(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.createdAt,
      required this.username,
      required this.city,
      required this.catrgory,
      required this.messagesCount,
      required this.entAt,
      required this.id})
      : super(key: key);
  final String imagePath;
  final String title;
  final String createdAt;
  final String username;
  final String city;
  final String catrgory;
  final String messagesCount;
  final String entAt;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 331.h,
      width: 377.w,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Container(
            height: 204.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11.r),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => SvgPicture.asset(
                        "assets/icons/contact_placeholder.svg",
                      ),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        "assets/icons/contact_placeholder.svg",
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(17, 0, 0, 0),
                        Color.fromARGB(199, 0, 0, 0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.more_vert, size: 14.w),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: kprimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 21.h,
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
                      Text(
                        createdAt,
                        style: GoogleFonts.tajawal(
                          color: const Color.fromRGBO(77, 77, 77, 1),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.5.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/man.svg"),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          username,
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
                  ],
                ),
                Text(
                  "#$id",
                  style: GoogleFonts.tajawal(
                    color: kGreyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          const Divider(
            color: kGreyColor,
          ),
          SizedBox(height: 11.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 21.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: kgreencolor),
                    ),
                    child: Center(
                      child: Text(
                        messagesCount,
                        style: GoogleFonts.tajawal(
                          color: kgreencolor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/empty_meesage.svg",
                        color: kgreencolor,
                      ),
                      SizedBox(width: 10.h),
                      Text(
                        "رساله",
                        style: GoogleFonts.tajawal(
                          color: kgreencolor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                "$entAt : انتهاء الاعلان",
                style: GoogleFonts.tajawal(
                  color: kprimaryColor,
                  fontSize: 14.sp,
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
