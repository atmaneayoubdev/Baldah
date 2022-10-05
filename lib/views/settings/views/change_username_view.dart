import 'dart:io';

import 'package:balda/common/large_button.dart';
import 'package:balda/controllers/auth_controller.dart';
import 'package:balda/models/AuthModels/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../helpers/user_provider.dart';

class ChangeUserView extends StatefulWidget {
  const ChangeUserView({Key? key}) : super(key: key);
  static const String routeName = '/change_user';

  @override
  State<ChangeUserView> createState() => _ChangeUserViewState();
}

class _ChangeUserViewState extends State<ChangeUserView> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String photo = "";
  List<File> imgs = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    firstName.text =
        Provider.of<UserProvider>(context, listen: false).user.firstName;
    lastName.text =
        Provider.of<UserProvider>(context, listen: false).user.lastName;
    photo = Provider.of<UserProvider>(context, listen: false).user.photo;
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      body: Stack(children: [
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
                "معلومات الحساب",
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
              padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.r),
                    topRight: Radius.circular(31.r)),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kprimaryColor),
                      ),
                      child: Stack(
                        children: [
                          if (imgs.isEmpty)
                            Center(
                              child: Container(
                                height: 150.h,
                                width: 150.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(255, 255, 255, 0.17),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: CachedNetworkImage(
                                    imageUrl: Provider.of<UserProvider>(context,
                                            listen: true)
                                        .user
                                        .photo,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        SvgPicture.asset(
                                      "assets/icons/contact_placeholder.svg",
                                    ),
                                    errorWidget: (context, url, error) =>
                                        SvgPicture.asset(
                                      "assets/icons/contact_placeholder.svg",
                                    ),
                                  ),
                                ),
                                // SvgPicture.asset("assets/icons/contact_placeholder.svg"),
                              ),
                            ),
                          if (imgs.isNotEmpty)
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(300),
                                child: Image.file(
                                  imgs.first,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () async {
                                await _picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      imgs.add(File(value.path));
                                    });
                                  }
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kprimaryColor,
                                ),
                                child: const Icon(
                                  Icons.mode_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 11.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الاسم الاول",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    color: kprimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 11.h),
                                Container(
                                  decoration: BoxDecoration(
                                      color: klightGreynColor,
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: TextField(
                                    controller: firstName,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 18.sp,
                                      color: kGreyColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 11.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الاسم الاخير",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    color: kprimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 11.h),
                                Container(
                                  decoration: BoxDecoration(
                                      color: klightGreynColor,
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: TextField(
                                    controller: lastName,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 18.sp,
                                      color: kGreyColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await AuthController.editAccount(
                            token: Provider.of<UserProvider>(
                              context,
                              listen: false,
                            ).user.apiToken,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            image: imgs.isNotEmpty ? imgs.first : null,
                          ).then((value) async {
                            if (value == "OK") {
                              await AuthController.getUserData(user.id)
                                  .then((value) {
                                User user = User(
                                    id: value.id,
                                    firstName: value.firstName,
                                    lastName: value.lastName,
                                    phoneNumber: value.phoneNumber,
                                    apiToken: value.apiToken,
                                    active: value.active,
                                    upgrade: value.upgrade,
                                    photo: value.photo,
                                    createdAt: value.createdAt);
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .setUser(user);
                              }).then(
                                (value) => Navigator.pop(context),
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "تأكد من المعلومات",
                                    style: GoogleFonts.tajawal(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  backgroundColor: kprimaryColor,
                                ),
                              );
                            }

                            //Navigator.pop(context);
                          });
                        },
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
              ),
            ),
          ],
        ),
        if (isLoading)
          Container(
            color: Colors.black45,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ]),
    );
  }
}
