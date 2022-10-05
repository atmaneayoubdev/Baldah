import 'package:balda/views/advertisments/widgets/finished_ad_widget.dart';
import 'package:balda/views/advertisments/widgets/horizontal_ad_widget.dart';
import 'package:balda/views/favorite/views/favorite_view.dart';
import 'package:balda/views/notification/view/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:balda/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controllers/ads_controller.dart';
import '../../../helpers/user_provider.dart';
import '../../../models/AdsModels/ad.dart';

class MainAdsView extends StatefulWidget {
  const MainAdsView({Key? key}) : super(key: key);
  static const String routeName = '/ads_main';

  @override
  State<MainAdsView> createState() => _MainAdsViewState();
}

class _MainAdsViewState extends State<MainAdsView> {
  List<Ad> _activeAds = [];
  List<Ad> _finishedAds = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
        await AdsController.gatActiveAds(
          Provider.of<UserProvider>(context, listen: false).user.apiToken,
        ).then((value) {
          if (mounted) {
            setState(() {
              _activeAds = value;
            });
          }
        });
      }
      if (mounted) {
        await AdsController.getFinishedAds(
          Provider.of<UserProvider>(context, listen: false).user.apiToken,
        ).then((value) {
          if (mounted) {
            setState(() {
              _finishedAds = value;
              isLoading = false;
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundgreyColor,
      body: Stack(
        children: [
          Container(
            height: 293.h,
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
            child: Column(children: [
              SizedBox(
                height: 52.h,
              ),
              Container(
                //height: 24.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, FavoriteView.routeName),
                      child: Image.asset(
                        "assets/icons/heart.png",
                        height: 20.h,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "الاعلانات",
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        NotificationsView.routeName,
                      ),
                      child: Image.asset(
                        "assets/icons/bell.png",
                        height: 25.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    "الاعلانات النشطه",
                    style: GoogleFonts.tajawal(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 20.h,
                    //width: 49.w,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Center(
                      child: Text(
                        _activeAds.length.toString(),
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: kGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  if (_activeAds.isNotEmpty)
                    SizedBox(
                      height: 384.h,
                      width: double.infinity,
                      child: ListView.separated(
                        padding: EdgeInsets.only(right: 17.w),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _activeAds.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 12.w,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.of(context)
                              //     .pushNamed(AdsMessagesView.routeName);
                            },
                            child: HorizontalAdWidget(
                              imagePath: _activeAds[index].photos.isNotEmpty
                                  ? _activeAds[index].photos.first.photo
                                  : "",
                              title: _activeAds[index].title,
                              createdAt: _activeAds[index].createdAt,
                              username: _activeAds[index].user.firstName,
                              city: _activeAds[index].city.name,
                              catrgory: _activeAds[index].category.name,
                              messagesCount: "0",
                              entAt: _activeAds[index].endAt,
                              id: _activeAds[index].id.toString(),
                            ),
                          );
                        },
                      ),
                    ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40.w,
                      ),
                      Text(
                        "الاعلانات المنتهيه",
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          color:
                              _activeAds.isEmpty ? Colors.white : kprimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 20.h,
                        //width: 49.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 17.w),
                        decoration: BoxDecoration(
                            color: _activeAds.isEmpty
                                ? Colors.white
                                : const Color.fromRGBO(51, 124, 201, 0.11),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Center(
                          child: Text(
                            _finishedAds.length.toString(),
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: kprimaryColor,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  if (_finishedAds.isNotEmpty)
                    SizedBox(
                      height: 192.h,
                      width: double.infinity,
                      child: ListView.separated(
                        padding: EdgeInsets.only(right: 17.w, left: 17.w),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _finishedAds.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 12.w,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.of(context)
                              //     .pushNamed(ChatView.routeName);
                            },
                            child: FinishedAdWidget(
                                imagePath: _activeAds[index].photos.first.photo,
                                title: _activeAds[index].title,
                                createdAt: _activeAds[index].createdAt,
                                username: _activeAds[index].user.firstName,
                                city: _activeAds[index].city.name,
                                catrgory: _activeAds[index].category.name,
                                messagesCount: "0",
                                entAt: _activeAds[index].endAt,
                                id: _activeAds[index].id.toString()),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
