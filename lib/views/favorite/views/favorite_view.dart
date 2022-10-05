import 'package:balda/controllers/ads_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/models/AdsModels/ad.dart';
import 'package:balda/views/Home/views/details_view.dart';
import 'package:balda/views/Home/widgets/home_verticale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);
  static const String routeName = '/favorite';

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List<Ad> _ads = [];
  void getFavoriteAds() async {
    await AdsController.getFavoriteAds(
      Provider.of<UserProvider>(context, listen: false).user.apiToken,
    ).then((value) {
      setState(() {
        _ads = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      getFavoriteAds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(32, 127, 201, 1),
            kprimaryColor,
          ],
        )),
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
            height: 150.h,
            decoration: const BoxDecoration(),
            width: double.infinity,
            child: Stack(
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "المفضلة",
                    style: GoogleFonts.tajawal(
                        fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kbackgroundgreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31.r),
                  topRight: Radius.circular(31.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        //height: 800.h,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 20.h),
                        decoration: BoxDecoration(
                          color: kbackgroundgreyColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(31.r),
                            topRight: Radius.circular(31.r),
                          ),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: _ads.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            Ad ad = _ads[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailsView(adID: ad.id)),
                                );
                              },
                              child: HomeVerticaleWidget(
                                adId: ad.id,
                                rate: ad.rate,
                                catrgory: ad.subCategory.name,
                                city: ad.city.name,
                                createdAt: ad.createdAt,
                                discription: ad.title,
                                imagePath: ad.photos.isNotEmpty
                                    ? ad.photos[0].photo
                                    : "",
                                isFavorite:
                                    ad.isFavorite == 'true' ? true : false,
                                username: ad.user.firstName,
                              ),
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
