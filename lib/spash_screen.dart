import 'dart:async';
import 'package:balda/controllers/auth_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/tab_view.dart';
import 'package:balda/views/Auth/first_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    Timer(const Duration(seconds: 3), () {
      if (kDebugMode) {
        print("Yeah, this line is printed after 3 seconds");
      }
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
