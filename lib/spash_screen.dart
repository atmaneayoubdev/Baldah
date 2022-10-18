import 'dart:async';
import 'package:balda/constants.dart';
import 'package:balda/controllers/auth_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/tab_view.dart';
import 'package:balda/views/Auth/first_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await SharedPreferences.getInstance().then((value) async {
        if (value.getString("id") != null) {
          await AuthController.getUserData(value.getString("id")!)
              .then((value) {
            setState(() {
              Provider.of<UserProvider>(context, listen: false).user.id =
                  value.id;
              Provider.of<UserProvider>(context, listen: false).user.active =
                  value.active;
              Provider.of<UserProvider>(context, listen: false).user.apiToken =
                  value.apiToken;
              Provider.of<UserProvider>(context, listen: false).user.firstName =
                  value.firstName;
              Provider.of<UserProvider>(context, listen: false).user.lastName =
                  value.lastName;

              Provider.of<UserProvider>(context, listen: false).user.photo =
                  value.photo;

              Provider.of<UserProvider>(context, listen: false).user.upgrade =
                  value.upgrade;

              Provider.of<UserProvider>(context, listen: false).user.createdAt =
                  value.createdAt;

              Provider.of<UserProvider>(context, listen: false)
                  .user
                  .phoneNumber = value.phoneNumber;
            });
          });
        } else {
          Provider.of<UserProvider>(context, listen: false).clearUser();
        }
      });
    });

    Timer(const Duration(seconds: 3), () async {
      if (kDebugMode) {
        print("Yeah, this line is printed after 3 seconds");
      }

      final prefs = await SharedPreferences.getInstance();
      if (prefs.getString("first") == null) {
        prefs.setString("first", "true");
        showMaterialModalBottomSheet<bool>(
          context: context,
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.transparent,
          builder: (context) => const PrivacyPolicyBottomSheet(),
        ).then((value) {
          if (value!) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        Provider.of<UserProvider>(context, listen: false)
                                    .user
                                    .apiToken !=
                                ""
                            ? const TabView()
                            : const FirstView())));
          }
        });
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    Provider.of<UserProvider>(context, listen: false)
                                .user
                                .apiToken !=
                            ""
                        ? const TabView()
                        : const FirstView())));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(32, 87, 166, 1),
        ),
        child: Center(
          child: SizedBox(
            height: 200.h,
            child: Image.asset("assets/images/appicon.png"),
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicyBottomSheet extends StatelessWidget {
  const PrivacyPolicyBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.h,
      width: 300.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Stack(children: [
        Column(
          children: [
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                  "https://baldahapp.com/api/privacy_and_policies",
                )),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    //Navigator.pop(context, false);
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: kprimaryColor)),
                    child: Center(
                      child: Text(
                        "No",
                        style: GoogleFonts.tajawal(
                          fontSize: 18.sp,
                          color: kprimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(32, 127, 201, 1),
                              kprimaryColor,
                            ],
                          )),
                      child: Center(
                        child: Text(
                          "yes",
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
