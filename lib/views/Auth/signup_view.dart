import 'package:flutter/material.dart';
import 'package:balda/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../helpers/user_provider.dart';
import '../../models/AuthModels/user.dart';
import '../../tab_view.dart';
import 'signin_view.dart';

class SignUpView extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 425.h,
                      width: double.infinity,
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
                          SizedBox(height: 52.h),
                          Container(
                            margin: EdgeInsets.only(left: 374.w),
                            height: 27.h,
                            width: 27.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              color: kopacity,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_left,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
                        ],
                      ),
                    ),
                    SizedBox(height: 414.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInView.routeName);
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
                            Text('لديك حساب بالفعل ؟   ',
                                style: GoogleFonts.tajawal(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                )),
                            Text(
                              "تسجيل دخول",
                              style: GoogleFonts.tajawal(
                                  color: Colors.black, fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 280.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 25.h),
                      height: 540.h,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "انشاء حساب",
                              style: GoogleFonts.tajawal(
                                fontSize: 24.sp,
                                color: kprimaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 37.h,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الاسم الاول",
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
                                      color: const Color.fromARGB(
                                          255, 247, 247, 247),
                                    ),
                                    child: TextField(
                                      controller: firstNameController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الاسم الاخير",
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
                                      color: const Color.fromARGB(
                                          255, 247, 247, 247),
                                    ),
                                    child: TextField(
                                      controller: lastNameController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 14.h),
                          Column(
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
                                  color:
                                      const Color.fromARGB(255, 247, 247, 247),
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 23.h),
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
                                "كلمه المرور",
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
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await AuthController.register(
                                phoneNumber: phoneController.text,
                                password: passwordController.text,
                                deviceToken: "0000000000",
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                              ).then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                                if (value.runtimeType == User) {
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .id = value.id;
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .active = value.active;
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .apiToken = value.apiToken;
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .firstName = value.firstName;
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .lastName = value.lastName;

                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .photo = value.photo;

                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .upgrade = value.upgrade;

                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .createdAt = value.createdAt;

                                  Provider.of<UserProvider>(context,
                                          listen: false)
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
                                  "تسجيل",
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
                    SizedBox(
                      height: 118.h,
                    ),
                  ],
                ),
              ],
            ),
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
