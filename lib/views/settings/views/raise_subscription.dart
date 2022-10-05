import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/large_button.dart';
import '../../../constants.dart';

class RaiseSubscription extends StatefulWidget {
  const RaiseSubscription({Key? key}) : super(key: key);
  static const String routeName = '/raise_suscription';

  @override
  State<RaiseSubscription> createState() => _RaiseSubscriptionState();
}

class _RaiseSubscriptionState extends State<RaiseSubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
          height: 326.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(32, 127, 201, 1),
              kprimaryColor,
            ],
          )),
          width: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 27.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: const FittedBox(
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 100.w),
              Text(
                "ترقيه الحساب",
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 798.h,
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.r),
                    topRight: Radius.circular(31.r)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 252.w,
                    child: Text(
                      "ترقيه الحساب لمده سنه كامله فقط 200 ريال ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontSize: 20.sp,
                        color: kGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  const Divider(
                    height: 2,
                    color: kGreyColor,
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  SizedBox(
                    width: 352.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: 15.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "رقم البطاقة",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                color: kprimaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.5.h),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 59.h,
                          width: 352.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: const Color.fromARGB(255, 247, 247, 247),
                          ),
                          child: const TextField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تاريخ الانتهاء",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: kprimaryColor,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 14.5.h),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 59.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: const Color.fromARGB(255, 247, 247, 247),
                            ),
                            child: const TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "رقم cvv",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: kprimaryColor,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 14.5.h),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 59.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: const Color.fromARGB(255, 247, 247, 247),
                            ),
                            child: const TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  الاجمالي المطلوب   ",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                            Text(
                              "200 ريال",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                color: kprimaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 11.h),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: LargeButton(
                                      height: 53.h,
                                      width: 350.w,
                                      color: kprimaryColor,
                                      name: "حفظ"),
                                ),
                                SizedBox(
                                  height: 80.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
