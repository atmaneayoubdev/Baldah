import 'package:balda/common/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../helpers/user_provider.dart';

class ChnagePasswordView extends StatefulWidget {
  const ChnagePasswordView({Key? key}) : super(key: key);
  static const String routeName = '/change_pass';

  @override
  State<ChnagePasswordView> createState() => _ChnagePasswordViewState();
}

class _ChnagePasswordViewState extends State<ChnagePasswordView> {
  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Stack(
            children: [
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
                      "تعديل كلمه المرور",
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 30.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(31.r),
                          topRight: Radius.circular(31.r)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          //height: 95.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 11.h),
                          decoration: const BoxDecoration(
                              // border: Border(
                              //   bottom: BorderSide(color: klightGreynColor, width: 1),
                              // ),
                              ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "كلمه المرور الحاليه",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 11.h),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.tajawal(
                                  fontSize: 18.sp,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                controller: currentPass,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: klightGreynColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: klightGreenColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Container(
                          //height: 95.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 11.h),
                          decoration: const BoxDecoration(
                              // border: Border(
                              //   bottom: BorderSide(color: klightGreynColor, width: 1),
                              // ),
                              ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "كلمه المرور الجديده",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 11.h),
                              TextField(
                                controller: newPass,
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.tajawal(
                                  fontSize: 18.sp,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: klightGreynColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: klightGreenColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 330.h,
                              ),
                              GestureDetector(
                                onTap: (() async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await AuthController.changePassword(
                                    token: Provider.of<UserProvider>(
                                      context,
                                      listen: false,
                                    ).user.apiToken,
                                    currentPass: currentPass.text,
                                    newPass: newPass.text,
                                  ).then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(value.toString())));
                                  }).then((value) => Navigator.pop(context));
                                }),
                                child: Center(
                                  child: LargeButton(
                                    height: 53.h,
                                    width: 350.w,
                                    color: kprimaryColor,
                                    name: "حفظ",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 80.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isLoading)
            const Center(
              child: Center(
                  child: CircularProgressIndicator(
                color: kprimaryColor,
              )),
            )
        ],
      ),
    );
  }
}
