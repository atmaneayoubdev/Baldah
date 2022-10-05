import 'package:balda/views/settings/views/change_phone_view.dart';
import 'package:balda/views/settings/views/change_username_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../helpers/user_provider.dart';
import '../views/change_password_view.dart';

class FirstSettingsView extends StatefulWidget {
  const FirstSettingsView({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstSettingsView> createState() => _FirstSettingsViewState();
}

class _FirstSettingsViewState extends State<FirstSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChangeUserView.routeName);
                },
                child: Container(
                  height: 95.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 11.h),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: klightGreynColor, width: 1))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم المستخدم",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: kprimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${Provider.of<UserProvider>(context, listen: false).user.firstName} ${Provider.of<UserProvider>(context, listen: false).user.lastName}",
                            style: GoogleFonts.tajawal(
                              fontSize: 18.sp,
                              color: kGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 24.w,
                            width: 74.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: kprimaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "تعديل",
                                style: GoogleFonts.tajawal(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 95.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 11.h),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: klightGreynColor, width: 1))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "رقم الجوال",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: kprimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Provider.of<UserProvider>(context, listen: false)
                              .user
                              .phoneNumber,
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ChangePhoneView.routeName),
                          child: Container(
                            height: 24.w,
                            width: 74.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: kprimaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "تعديل",
                                style: GoogleFonts.tajawal(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 95.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 11.h),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: klightGreynColor, width: 1))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "كلمه السر",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: kprimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "**********",
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ChnagePasswordView.routeName);
                          },
                          child: Container(
                            height: 24.w,
                            width: 74.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: kprimaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "تعديل",
                                style: GoogleFonts.tajawal(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
        ),
      ),
    );
  }
}
