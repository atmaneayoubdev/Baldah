import 'dart:io';

import 'package:balda/controllers/ads_controller.dart';
import 'package:balda/controllers/auth_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/views/settings/views/payement_view.dart';
import 'package:balda/views/settings/widgets/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../models/PublicModels/bank.dart';

class SecondSettingsViewWidget extends StatefulWidget {
  const SecondSettingsViewWidget({Key? key, required this.banks})
      : super(key: key);
  final List<Bank> banks;

  @override
  State<SecondSettingsViewWidget> createState() =>
      _SecondSettingsViewWidgetState();
}

class _SecondSettingsViewWidgetState extends State<SecondSettingsViewWidget> {
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  TextEditingController priceController = TextEditingController();
  String commission = "";
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
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    //height: 38.h,
                    width: 296.w,
                    child: Center(
                      child: Text(
                        "العمولة أمانة في ذمة المعلن سواء تمت المبايعة عن طريق الموقع أو بسببه، وموضحة قيمتها بما يلي",
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: kGreyColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Navigator.pushNamed(context, RaiseSubscription.routeName)
                      //     .then((value) {
                      //   showMaterialModalBottomSheet(
                      //     context: context,
                      //     backgroundColor: Colors.transparent,
                      //     builder: (context) => const SubscriptionRaised(),
                      //   );
                      // });
                      // setState(() {
                      //   isLoading = true;
                      // });
                      if (Provider.of<UserProvider>(context, listen: false)
                              .user
                              .upgrade ==
                          "false") {
                        await _picker
                            .pickImage(source: ImageSource.gallery)
                            .then((value) async {
                          if (value != null) {
                            setState(() {
                              isLoading = true;
                            });
                            await AuthController.upgradAccount(
                                    token: Provider.of<UserProvider>(context,
                                            listen: false)
                                        .user
                                        .apiToken,
                                    image: File(value.path))
                                .then((value) {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(value.toString()),
                              ));
                            });
                          }
                        });
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 156.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.r),
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(64, 172, 66, 1))),
                      child: Center(
                        child: Text(
                          "ترقيه الحساب",
                          style: GoogleFonts.tajawal(
                            fontSize: 14.sp,
                            color: const Color.fromRGBO(64, 172, 66, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 163.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.banks.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 7.w,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return AccountWidget(
                          iban: widget.banks[index].ibanNbr,
                          accountNumber: widget.banks[index].accountNbr,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "ادخل سعر البيع",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: kprimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 59.h,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: klightGreynColor,
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "110.00",
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            onSubmitted: (value) async {
                              setState(() {
                                isLoading = true;
                              });
                              await AdsController.payCommission(
                                token: Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).user.apiToken,
                                amount: double.parse(value),
                              ).then((value) async {
                                setState(() {
                                  isLoading = false;
                                });
                                priceController.clear();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PayementView(url: value),
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "ريال سعودي",
                            style: GoogleFonts.tajawal(
                              fontSize: 14.sp,
                              color: kGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "العموله المستحقه",
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: const Color.fromRGBO(64, 172, 66, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "$commission ريال سعودي",
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: const Color.fromRGBO(64, 172, 66, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kprimaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
