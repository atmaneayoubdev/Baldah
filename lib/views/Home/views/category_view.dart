import 'package:balda/common/settings_model.dart';
import 'package:balda/constants.dart';
import 'package:balda/controllers/public_controller.dart';
import 'package:balda/models/PublicModels/sub_catergory.dart';
import 'package:balda/views/Home/views/details_view.dart';
import 'package:balda/views/Home/widgets/category_show_widget.dart';
import 'package:balda/views/Home/widgets/category_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controllers/ads_controller.dart';
import '../../../helpers/user_provider.dart';
import '../../../models/AdsModels/ad.dart';
import '../widgets/home_verticale_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  const CategoryView(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);
  static const String routeName = '/cat_view';
  final int categoryId;
  final String categoryName;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  TextEditingController searchText = TextEditingController();
  bool isAdsLoading = true;
  List<SubCategory> _subCategories = [];
  List<Ad> _ads = [];
  SubCategory _selectedSubCat =
      SubCategory(id: 0, name: '', cratedAt: ' ', categoryId: 0);

  ScrollController controller = ScrollController();
  bool nextPage = false;
  int pageNbr = 1;

  Future getCategoryAds(
      {required String catID,
      required String subcatID,
      required int page}) async {
    await AdsController.adCategoryFilter(
      token: Provider.of<UserProvider>(context, listen: false).user.apiToken,
      categoryId: catID,
      subCategoryID: subcatID,
      pageNumber: page,
    ).then((value) {
      setState(() {
        print(value);
        _ads.addAll(value["ads"]);
        nextPage = value["next"];
        if (nextPage) pageNbr++;
      });
    });
  }

  Future searchAds(String key) async {
    await AdsController.searhAd(
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).user.apiToken,
      key,
    ).then((value) {
      if (mounted) {
        setState(() {
          _ads = value;
        });
      }
    });
  }

  Future getSubCategories() async {
    await PublicContoller.getSubCategories(widget.categoryId).then((value) {
      setState(() {
        _subCategories = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSubCategories();
    getCategoryAds(
      catID: widget.categoryId.toString(),
      subcatID: _selectedSubCat.id.toString(),
      page: pageNbr,
    ).then((value) {
      setState(() {
        isAdsLoading = false;
      });
    });
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (nextPage) {
          getCategoryAds(
            catID: widget.categoryId.toString(),
            subcatID: _selectedSubCat.id.toString(),
            page: pageNbr,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 160.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      height: 47.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 25.sp),
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.categoryName,
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      //padding: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 42.h,
                      //width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 42.h,
                              //width: 320.w,
                              decoration: BoxDecoration(
                                color: kopacity,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  SvgPicture.asset("assets/icons/search.svg"),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      expands: false,
                                      style: GoogleFonts.tajawal(
                                          fontSize: 15.sp, color: Colors.white),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "بحث عن",
                                        hintStyle:
                                            TextStyle(color: Colors.white30),
                                      ),
                                      textInputAction: TextInputAction.search,
                                      onSubmitted: (String key) async {
                                        searchAds(key);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              showMaterialModalBottomSheet<Map>(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => SettingsModelWidget(
                                    catID: widget.categoryId.toString()),
                              ).then((value) {
                                setState(() {
                                  if (value != null) {
                                    _ads = value["adsList"];
                                    debugPrint(value["subCategory"]);
                                    _selectedSubCat = value["subCategory"];
                                  }
                                });
                              });
                            },
                            child: Container(
                              height: 42.h,
                              width: 49.w,
                              decoration: BoxDecoration(
                                color: kopacity,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/settings2.svg",
                                height: 15.h,
                                width: 18.w,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 25.sp),
                  alignment: Alignment.topRight,
                  child: Text(
                    "معارض مميزه",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: kprimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.5.h,
                ),
                Container(
                  height: 128.h,
                  margin: EdgeInsets.only(right: 25.sp),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 7.5.w,
                    ),
                    itemBuilder: (BuildContext ctx, int index) =>
                        const CategoryShowWidget(),
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 25.sp),
                  alignment: Alignment.topRight,
                  child: Text(
                    "وش حاب تدور عليه ؟",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: kprimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  height: 42.h,
                  margin: EdgeInsets.only(right: 25.sp),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: _subCategories.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 7.5.w,
                    ),
                    itemBuilder: (BuildContext ctx, int index) =>
                        Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () async {
                          if (_selectedSubCat != _subCategories[index]) {
                            setState(() {
                              isAdsLoading = true;
                              _selectedSubCat = _subCategories[index];
                              pageNbr = 0;
                              _ads.clear();
                            });
                            getCategoryAds(
                              catID: widget.categoryId.toString(),
                              subcatID: _selectedSubCat.id.toString(),
                              page: pageNbr,
                            ).then((value) {
                              setState(() {
                                isAdsLoading = false;
                              });
                            });
                          }
                        },
                        child: CategoryTypeWidget(
                          selected:
                              _selectedSubCat.id == _subCategories[index].id
                                  ? true
                                  : false,
                          name: _subCategories[index].name,
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 34.4.h,
                ),
                Container(
                  margin: EdgeInsets.only(right: 25.sp),
                  height: 20.h,
                  child: Row(
                    children: [
                      Text(
                        "كل الاعلانات",
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: kprimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "",
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.4.h,
                ),
                Expanded(
                  child: isAdsLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kprimaryColor,
                          ),
                        )
                      : _ads.isEmpty
                          ? Center(
                              child: Text(
                                "لا يوجد إعلانات",
                                style: GoogleFonts.tajawal(
                                  fontSize: 20.sp,
                                  color: kprimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : ListView.separated(
                              controller: controller,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: _ads.length + 1,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                if (index < _ads.length) {
                                  Ad ad = _ads[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                DetailsView(adID: ad.id)),
                                      ).then((value) {
                                        setState(() {
                                          setState(() {
                                            isAdsLoading = true;
                                            _ads.clear();
                                            pageNbr = 0;
                                          });
                                        });
                                        getCategoryAds(
                                          catID: widget.categoryId.toString(),
                                          subcatID:
                                              _selectedSubCat.id.toString(),
                                          page: pageNbr,
                                        ).then((value) {
                                          setState(() {
                                            setState(() {
                                              isAdsLoading = false;
                                            });
                                          });
                                        });
                                      });
                                    },
                                    child: HomeVerticaleWidget(
                                      adId: ad.id,
                                      rate: ad.rate,
                                      catrgory: ad.subCategory.name,
                                      city: ad.city.name,
                                      createdAt: ad.createdAt,
                                      discription: ad.title,
                                      imagePath: ad.photos.isNotEmpty
                                          ? ad.photos.first.photo
                                          : "",
                                      isFavorite: ad.isFavorite == 'true'
                                          ? true
                                          : false,
                                      username: ad.user.firstName,
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: nextPage
                                        ? const CircularProgressIndicator()
                                        : const SizedBox(),
                                  );
                                }
                              },
                            ),
                ),
              ],
            ),
          ],
        ));
  }
}
