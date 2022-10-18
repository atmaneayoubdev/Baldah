import 'package:balda/constants.dart';
import 'package:balda/tab_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signin_view.dart';
import 'signup_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);
  static const String routeName = '/firstscreen';

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  bool privabyAccepted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 819.h,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(32, 127, 201, 1),
                  kprimaryColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(43),
                bottomRight: Radius.circular(43),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 52.h),
                // Container(
                //   margin: EdgeInsets.only(left: 374.w),
                //   height: 27.h,
                //   width: 27.w,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.circular(5),
                //     color: kopacity,
                //   ),
                //   child: const Center(
                //     child: Icon(
                //       Icons.arrow_left,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                SizedBox(height: 41.h),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(0),
                  margin: EdgeInsets.only(right: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اهلا بك",
                        style: GoogleFonts.tajawal(
                          fontSize: 34.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "في تطبيق بلدة",
                        style: GoogleFonts.tajawal(
                          fontSize: 34.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 77.h),
                SizedBox(
                  height: 230.h,
                  width: 230.w,
                  child: Image.asset("assets/images/appicon.png"),
                ),
                SizedBox(height: 116.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignInView()),
                    );
                  },
                  child: Container(
                    height: 51.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "تسجيل دخول",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: kprimaryTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 17.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpView.routeName);
                  },
                  child: Container(
                    height: 51.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kopacity,
                    ),
                    child: Center(
                      child: Text(
                        "انشاء حساب",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const TabView())));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "استكشف بلدة اولا",
                      style: GoogleFonts.tajawal(
                        height: 2,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                        color: kprimaryTextColor,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kprimaryColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/double_chevron.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
