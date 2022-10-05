import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdView extends StatefulWidget {
  const AdView(
      {Key? key,
      required this.username,
      required this.photoPath,
      required this.title,
      required this.userPhotoPath})
      : super(key: key);

  final String username;
  final String photoPath;
  final String title;
  final String userPhotoPath;

  @override
  State<AdView> createState() => _AdViewState();
}

class _AdViewState extends State<AdView> {
  double _width = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1), () async {
      setState(() {
        _width = 379.w;
      });
    });
    Timer(const Duration(seconds: 5), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 65.h,
          ),
          SizedBox(
            height: 5.h,
            width: 379.w,
            child: Stack(
              children: [
                Container(
                  height: 5.h,
                  width: 379.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: const Color.fromRGBO(237, 237, 237, 0.5),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 5000),
                  height: 5.h,
                  width: _width,
                  constraints: BoxConstraints(maxWidth: 379.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: CachedNetworkImage(
                            imageUrl: widget.userPhotoPath,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => SvgPicture.asset(
                              "assets/icons/person.svg",
                            ),
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(
                              "assets/icons/person.svg",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      widget.username,
                      style: GoogleFonts.tajawal(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white60,
                    ),
                    child: const FittedBox(
                        child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 87.h,
          ),
          SizedBox(
            height: 500.h,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: CachedNetworkImage(
                    imageUrl: widget.photoPath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SvgPicture.asset(
                      "assets/icons/contact_placeholder.svg",
                    ),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      "assets/icons/contact_placeholder.svg",
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0),
                        Color.fromRGBO(0, 0, 0, 0.7),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    height: 23.h,
                    //width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FittedBox(
                          child: Icon(
                            Icons.access_time,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "منذ ساعه",
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.tajawal(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 53.h,
                  width: 350.w,
                  //width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(color: Colors.white)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                  child: Center(
                    child: Text(
                      "منذ ساعه",
                      style: GoogleFonts.tajawal(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
