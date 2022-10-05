import 'package:balda/models/AuthModels/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../constants.dart';

class DetailsVerticaleWidget extends StatelessWidget {
  const DetailsVerticaleWidget(
      {Key? key,
      required this.user,
      required this.comment,
      required this.createdAt})
      : super(key: key);
  final User user;
  final String comment;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      width: 390.w,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: klightGreenColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 81.h,
            width: 80.w,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                6.r,
              ),
              color: klightGreynColor,
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  6.r,
                ),
                child: CachedNetworkImage(
                  imageUrl: user.photo,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SvgPicture.asset(
                    "assets/icons/contact_placeholder.svg",
                  ),
                  errorWidget: (context, url, error) => SvgPicture.asset(
                    "assets/icons/contact_placeholder.svg",
                  ),
                )),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.firstName + user.lastName,
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
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 30.h,
                      width: 1,
                      color: kGreyColor,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(
                        comment,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.tajawal(
                          color: kGreyColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
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
