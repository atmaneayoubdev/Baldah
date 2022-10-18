import 'package:balda/constants.dart';
import 'package:balda/controllers/auth_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/views/Auth/first_view.dart';
import 'package:balda/views/settings/views/terms_and_conditions.dart';
import 'package:balda/views/settings/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdSettingsViewWidget extends StatefulWidget {
  const ThirdSettingsViewWidget(
      {Key? key,
      required this.facebook,
      required this.twitter,
      required this.whatsApp,
      required this.privacyPolicy,
      required this.termsAndConditions,
      required this.quitions})
      : super(key: key);
  final String facebook;
  final String twitter;
  final String whatsApp;
  final String privacyPolicy;
  final String termsAndConditions;
  final String quitions;

  @override
  State<ThirdSettingsViewWidget> createState() =>
      _ThirdSettingsViewWidgetState();
}

class _ThirdSettingsViewWidgetState extends State<ThirdSettingsViewWidget> {
  void _launchUrl(url) async {
    debugPrint(url);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 30.h,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => FaqView(text: widget.quitions)),
                //     );
                //   },
                //   child: const GridViewWidget(
                //     name: "الاساله الشائعه",
                //     svg: "assets/icons/grid1.svg",
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               PrivacyPolicy(text: widget.privacyPolicy)),
                //     );
                //   },
                //   child: const GridViewWidget(
                //     name: "سياسه الخصوصيه",
                //     svg: "assets/icons/grid2.svg",
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsAndConditions(
                              text: widget.termsAndConditions)),
                    );
                  },
                  child: const GridViewWidget(
                    name: "الشروط والاحكام",
                    svg: "assets/icons/grid3.svg",
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     _launchUrl(Uri.parse(
                //         "whatsapp://send?text=sample text&phone=${widget.whatsApp}"));
                //   },
                //   child: const GridViewWidget(
                //     name: "تواصل معنا",
                //     svg: "assets/icons/grid4.svg",
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     _launchUrl(Uri.parse(widget.twitter));
                //   },
                //   child: const GridViewWidget(
                //     name: "تويتر",
                //     svg: "assets/icons/grid5.svg",
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     _launchUrl(Uri.parse(widget.facebook));
                //   },
                //   child: const GridViewWidget(
                //     name: "فيس بوك",
                //     svg: "assets/icons/grid6.svg",
                //   ),
                // ),
                // const GridViewWidget(
                //   name: "قيم التطبيق",
                //   svg: "assets/icons/grid7.svg",
                // ),
                GestureDetector(
                  onTap: () async {
                    if (Provider.of<UserProvider>(context, listen: false)
                            .user
                            .id !=
                        "") {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthController.logout(
                        token: Provider.of<UserProvider>(context, listen: false)
                            .user
                            .apiToken,
                        deviceToken: "0000000000",
                      ).then((value) {
                        Provider.of<UserProvider>(context, listen: false)
                            .clearUser();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const FirstView(),
                            ),
                            (route) => false);
                      });
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const FirstView(),
                          ),
                          (route) => false);
                    }
                  },
                  child: GridViewWidget(
                    name: Provider.of<UserProvider>(context, listen: false)
                                .user
                                .id !=
                            ""
                        ? "تسجيل الخروج"
                        : "تسجيل الدخول",
                    svg: "assets/icons/grid8.svg",
                  ),
                ),
                if (Provider.of<UserProvider>(context, listen: false).user.id !=
                    "")
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthController.removeAccount(
                        token: Provider.of<UserProvider>(context, listen: false)
                            .user
                            .apiToken,
                      ).then((value) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const FirstView(),
                            ),
                            (route) => false);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color:
                                        const Color.fromRGBO(32, 87, 166, 0.04),
                                    shape: BoxShape.rectangle),
                                child: const Center(
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            FittedBox(
                              child: Text(
                                "حذف الحساب",
                                style: GoogleFonts.tajawal(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  )
              ],
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: kprimaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
