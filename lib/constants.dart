import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const baseUrl = 'http://www.baldahapp.com/api/v1/';

const Color kprimaryColor = Color.fromRGBO(32, 87, 166, 1);
const Color kopacity = Color.fromRGBO(255, 255, 255, 0.08);
const Color kprimaryTextColor = Color.fromRGBO(51, 127, 201, 1);
const Color kSecondaryColor = Color.fromARGB(255, 248, 248, 248);
const Color kborderColor = Color.fromRGBO(51, 127, 201, 0.5);
const Color kGreyColor = Color.fromRGBO(167, 167, 167, 1);
const Color klightGreenColor = Color.fromRGBO(251, 251, 251, 1);
const Color klightGreynColor = Color.fromRGBO(88, 88, 88, 0.06);
const Color kbackgroundgreyColor = Color.fromRGBO(247, 247, 247, 1);
const Color kgreencolor = Color.fromRGBO(64, 172, 66, 1);
const Color klightBlueColor = Color.fromRGBO(243, 247, 252, 1);

SnackBar loginSnackbar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      "عليك تسجيل الدخول أولا",
      style: GoogleFonts.tajawal(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.normal),
    ));
