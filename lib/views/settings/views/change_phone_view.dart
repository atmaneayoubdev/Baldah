import 'package:balda/common/large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../controllers/auth_controller.dart';
import '../../../helpers/user_provider.dart';
import '../../../models/AuthModels/user.dart';

class ChangePhoneView extends StatefulWidget {
  const ChangePhoneView({Key? key}) : super(key: key);
  static const String routeName = '/change_phone';

  @override
  State<ChangePhoneView> createState() => _ChangePhoneViewState();
}

class _ChangePhoneViewState extends State<ChangePhoneView> {
  TextEditingController phone = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    phone.text =
        Provider.of<UserProvider>(context, listen: false).user.phoneNumber;
  }

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
                      "تعديل رقم الهاتف",
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
                                "رقم الهاتف",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 11.h),
                              TextField(
                                controller: phone,
                                style: GoogleFonts.tajawal(
                                  fontSize: 18.sp,
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: klightGreynColor),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: klightGreenColor),
                                  ),
                                  hintText: Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .phoneNumber,
                                  hintStyle: GoogleFonts.tajawal(
                                    fontSize: 18.sp,
                                    color: kGreyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 480.h,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: (() async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await AuthController.changePhoneNumber(
                                      token: Provider.of<UserProvider>(
                                        context,
                                        listen: false,
                                      ).user.apiToken,
                                      phoneNumber: phone.text,
                                    ).then((value) {
                                      Provider.of<UserProvider>(
                                        context,
                                        listen: false,
                                      ).setUser(value);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  value.runtimeType == User
                                                      ? "ok"
                                                      : "not OK")));
                                    }).then((value) => Navigator.pop(context));
                                  }),
                                  child: LargeButton(
                                      height: 53.h,
                                      width: 350.w,
                                      color: kprimaryColor,
                                      name: "حفظ"),
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
              child: CircularProgressIndicator(
                color: kprimaryColor,
              ),
            )
        ],
      ),
    );
  }
}
