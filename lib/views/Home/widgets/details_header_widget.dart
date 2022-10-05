import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsHeaderWidget extends StatelessWidget {
  const DetailsHeaderWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.cityName,
    required this.createdAt,
  }) : super(key: key);

  final String imagePath;
  final String name;
  final String cityName;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              color: kprimaryColor,
            ),
            height: 58.h,
            width: 54.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                placeholder: (context, url) => SvgPicture.asset(
                  "assets/icons/contact_placeholder.svg",
                ),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  "assets/icons/contact_placeholder.svg",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: kprimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FittedBox(
                              child: Icon(
                            Icons.access_time,
                            color: kGreyColor,
                          )),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            createdAt,
                            style: GoogleFonts.tajawal(
                              color: kGreyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/location.svg"),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      cityName,
                      style: GoogleFonts.tajawal(
                        color: kprimaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
