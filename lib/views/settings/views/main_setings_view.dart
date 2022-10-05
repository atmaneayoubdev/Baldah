import 'package:balda/controllers/public_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/models/PublicModels/bank.dart';
import 'package:balda/models/PublicModels/settings.dart';
import 'package:balda/views/settings/widgets/first_view_widget.dart';
import 'package:balda/views/settings/widgets/second_view_widget.dart';
import 'package:balda/views/settings/widgets/third_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainSettingsView extends StatefulWidget {
  const MainSettingsView({Key? key}) : super(key: key);
  static const String routeName = '/settings_view';

  @override
  State<MainSettingsView> createState() => _MainSettingsViewState();
}

class _MainSettingsViewState extends State<MainSettingsView> {
  bool first_view = true;
  bool second_view = false;
  bool third_view = false;
  List<Bank> _banks = [];
  Settings _settings = Settings(
      upgradeAmount: "",
      facebook: "",
      twitter: "",
      whatsAppPhone: "",
      termsAndConditioins: "",
      publicQuistions: "",
      privacyPolicy: "");

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await PublicContoller.getBanks().then((value) {
        if (mounted) {
          setState(() {
            _banks = value;
          });
        }
      });
      await PublicContoller.getSettings().then((value) {
        if (mounted) {
          setState(() {
            _settings = value;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 250.h,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.h,
                width: 120.w,
                //padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(255, 255, 255, 0.17),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: CachedNetworkImage(
                    imageUrl: Provider.of<UserProvider>(context, listen: true)
                        .user
                        .photo,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SvgPicture.asset(
                      "assets/icons/contact_placeholder.svg",
                    ),
                    errorWidget: (context, url, error) => SvgPicture.asset(
                      "assets/icons/contact_placeholder.svg",
                    ),
                  ),
                ),
                // SvgPicture.asset("assets/icons/contact_placeholder.svg"),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "${Provider.of<UserProvider>(context, listen: true).user.firstName} ${Provider.of<UserProvider>(context, listen: true).user.lastName}",
                style: GoogleFonts.tajawal(
                  fontSize: 22.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.w),
          color: kbackgroundgreyColor,
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        first_view = true;
                        second_view = false;
                        third_view = false;
                      });
                    },
                    child: Container(
                      height: 32.h,
                      width: 114.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: first_view ? kprimaryColor : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "الملف الشخصي",
                          style: GoogleFonts.tajawal(
                            fontSize: 14.sp,
                            color: first_view ? Colors.white : kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        first_view = false;
                        second_view = true;
                        third_view = false;
                      });
                    },
                    child: Container(
                      height: 32.h,
                      width: 114.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: second_view ? kprimaryColor : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "تحويل العموله",
                          style: GoogleFonts.tajawal(
                            fontSize: 14.sp,
                            color: second_view ? Colors.white : kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        first_view = false;
                        second_view = false;
                        third_view = true;
                      });
                    },
                    child: Container(
                      height: 32.h,
                      width: 114.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: third_view ? kprimaryColor : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          "الاعدادات العامه",
                          style: GoogleFonts.tajawal(
                            fontSize: 14.sp,
                            color: third_view ? Colors.white : kGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              if (first_view) const FirstSettingsView(),
              if (second_view)
                SecondSettingsViewWidget(
                  banks: _banks,
                ),
              if (third_view)
                ThirdSettingsViewWidget(
                  facebook: _settings.facebook,
                  twitter: _settings.twitter,
                  whatsApp: _settings.whatsAppPhone,
                  privacyPolicy: _settings.privacyPolicy,
                  termsAndConditions: _settings.termsAndConditioins,
                  quitions: _settings.publicQuistions,
                ),
            ],
          ),
        )),
      ]),
    );
  }
}
