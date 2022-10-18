import 'package:balda/constants.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/views/Add/views/main_add_view.dart';
import 'package:balda/views/Home/views/home_view.dart';
import 'package:balda/views/advertisments/views/ads_main_view.dart';
import 'package:balda/views/messages/views/main_messages_view.dart';
import 'package:balda/views/settings/views/main_setings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);
  static const String routeName = '/tab';

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buildNavBarItem("assets/icons/home.svg", 0),
          buildNavBarItem("assets/icons/messages.svg", 1),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 13.h, bottom: 17.h),
              height: 69.h,
              width: MediaQuery.of(context).size.width / 5,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                height: 39.h,
                width: 61.w,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          buildNavBarItem("assets/icons/ads.svg", 3),
          buildNavBarItem("assets/icons/settings.svg", 4),
        ],
      ),
      body: _selectedIndex == 0
          ? const HomeView()
          : _selectedIndex == 1
              ? const MainMessagesView()
              : _selectedIndex == 3
                  ? const MainAdsView()
                  : _selectedIndex == 4
                      ? const MainSettingsView()
                      : const MainAddView(),
    );
  }

  buildNavBarItem(String icon, int index) {
    return GestureDetector(
      onTap: () {
        if (Provider.of<UserProvider>(context, listen: false).user.id == "" &&
            (index == 1 || index == 3)) {
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      child: Container(
        height: 75.h,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            color: _selectedIndex == index ? kprimaryColor : Colors.transparent,
            width: _selectedIndex == index ? 2 : 0,
          )),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                color: _selectedIndex == index
                    ? kprimaryColor
                    : Colors.grey.shade400,
              ),
              SizedBox(
                height: index == 3 ? 0.h : 3.h,
              ),
              Text(
                index == 0
                    ? "الرئيسيه"
                    : index == 1
                        ? "رسائل"
                        : index == 3
                            ? "الاعلانات"
                            : index == 4
                                ? "الاعدادات"
                                : "",
                style: GoogleFonts.tajawal(
                  fontSize: 13.sp,
                  color: _selectedIndex == index
                      ? kprimaryColor
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
