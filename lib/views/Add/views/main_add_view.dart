import 'package:balda/constants.dart';
import 'package:balda/views/Add/views/adding_view.dart';
import 'package:balda/views/favorite/views/favorite_view.dart';
import 'package:balda/views/notification/view/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAddView extends StatefulWidget {
  const MainAddView({Key? key}) : super(key: key);
  static const String routeName = '/add_view';

  @override
  State<MainAddView> createState() => _MainAddViewState();
}

class _MainAddViewState extends State<MainAddView> {
  final bool _isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: !_isEmpty
          ? const SizedBox()
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed(AddingView.routeName);
                });
              },
              focusColor: kprimaryColor,
              splashColor: kprimaryColor,
              backgroundColor: kprimaryColor,
              child: const Icon(
                Icons.add,
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(32, 127, 201, 1),
              kprimaryColor,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 52.h,
            ),
            Container(
              //height: 24.h,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, FavoriteView.routeName),
                    child: Image.asset(
                      "assets/icons/heart.png",
                      height: 20.h,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "بلدة معاكم اينما كنتم",
                      style: GoogleFonts.tajawal(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, NotificationsView.routeName);
                    },
                    child: Image.asset(
                      "assets/icons/bell.png",
                      height: 25.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.r),
                    topRight: Radius.circular(31.r),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20.w,
                    left: 20.w,
                    top: 20.h,
                  ),
                  child: _isEmpty
                      ? Column(
                          children: [
                            SizedBox(height: 50.h),
                            SizedBox(
                              height: 400.h,
                              child: Center(
                                child: Stack(children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      "assets/images/empty_add_back.svg",
                                      height: 400.h,
                                    ),
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                      "assets/images/empty_add.svg",
                                      height: 250.h,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Center(
                              child: Text(
                                "لاتوجد اي اعلانات تمت اضافتها من قبل !",
                                style: GoogleFonts.tajawal(
                                  fontSize: 20.sp,
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 17.h),
                            Center(
                              child: Text(
                                " سوف تتمكن من بيع مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر،",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
