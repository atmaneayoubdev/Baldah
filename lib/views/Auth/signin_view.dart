import 'package:balda/constants.dart';
import 'package:balda/controllers/auth_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/models/AuthModels/user.dart';
import 'package:balda/tab_view.dart';
import 'package:balda/views/Auth/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  static const String routeName = '/signin';
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: kprimaryColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 121.h),
              Container(
                width: double.infinity,
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
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 25.h),
                height: 468.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                    bottomLeft: Radius.circular(50.r),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      spreadRadius: 0.5,
                      offset: Offset(3, 10), // Shadow position
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "تسجيل دخول",
                          style: GoogleFonts.tajawal(
                            fontSize: 24.sp,
                            color: kprimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
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
                            "رقم الهاتف",
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
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: const Color.fromARGB(255, 247, 247, 247),
                        ),
                        child: TextField(
                          maxLines: 1,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(height: 34.h),
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            size: 15.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "كلمة المرور",
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
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: const Color.fromARGB(255, 247, 247, 247),
                        ),
                        child: TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // Text(
                      //   "نسيت كلمه المرور ؟",
                      //   style: GoogleFonts.tajawal(
                      //     fontSize: 16.sp,
                      //     color: Colors.black,
                      //     height: 1,
                      //   ),
                      // ),
                      SizedBox(
                        height: 34.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await AuthController.login(
                            phoneNumber: phoneController.text,
                            password: passwordController.text,
                          ).then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            if (value.runtimeType == User) {
                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .id = value.id;
                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .active = value.active;
                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .apiToken = value.apiToken;
                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .firstName = value.firstName;
                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .lastName = value.lastName;

                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .photo = value.photo;

                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .upgrade = value.upgrade;

                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .createdAt = value.createdAt;

                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .phoneNumber = value.phoneNumber;

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const TabView(),
                                  ),
                                  (route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: kprimaryColor,
                                content: Text(
                                  value,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ));
                            }
                          });
                        },
                        child: Container(
                          height: 53.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kprimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "دخول",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    child: Container(
                      width: 350.w,
                      height: 51.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: kprimaryColor),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ليس لديك حساب ؟   ',
                            style: GoogleFonts.tajawal(
                              color: Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "انشاء حساب",
                            style: GoogleFonts.tajawal(
                                color: Colors.black, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: kprimaryColor,
              ),
            )
        ],
      ),
    );
  }
}
