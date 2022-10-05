import 'package:balda/constants.dart';
import 'package:balda/models/AdsModels/ad_details.dart';
import 'package:balda/models/AdsModels/comment_model.dart';
import 'package:balda/models/AuthModels/user.dart';
import 'package:balda/models/PublicModels/category.dart';
import 'package:balda/models/PublicModels/city.dart';
import 'package:balda/models/PublicModels/sub_catergory.dart';
import 'package:balda/views/Home/widgets/details_header_widget.dart';
import 'package:balda/views/Home/widgets/details_verticale_widget.dart';
import 'package:balda/views/messages/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controllers/ads_controller.dart';
import '../../../helpers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/AdsModels/ad.dart';
import '../widgets/home_verticale_widget.dart';
import '../widgets/phone_call_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsView extends StatefulWidget {
  static const String routeName = '/details';

  const DetailsView({Key? key, required this.adID}) : super(key: key);
  final int adID;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool isLoading = true;
  bool isFav = false;
  bool isloadingfavorite = false;
  bool resps = false;
  List<Ad> _similarAds = [];
  TextEditingController commentController = TextEditingController();
  AdDetails _details = AdDetails(
    id: 0,
    user: User(
        id: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        apiToken: '',
        active: '',
        upgrade: '',
        photo: '',
        createdAt: ''),
    city: City(id: '', name: '', createdAt: ''),
    category: Category(id: 0, name: '', photoPath: ''),
    subCategory: SubCategory(id: 0, name: '', cratedAt: '', categoryId: 0),
    title: '',
    details: '',
    price: '',
    status: '',
    endAt: 'endAt',
    photos: [],
    isFavorite: '',
    rate: '',
    createdAt: '',
    comments: [],
  );

  void _launchUrl(url) async {
    debugPrint(url);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  Future<void> getDetails() async {
    await AdsController.getAdDetails(
      widget.adID,
      Provider.of<UserProvider>(context, listen: false).user.apiToken,
    ).then((value) {
      setState(() {
        _details = value;
      });
    });
    await AdsController.getSimilarAds(
      widget.adID,
      // ignore: use_build_context_synchronously
      Provider.of<UserProvider>(context, listen: false).user.apiToken,
    ).then((value) async {
      setState(() {
        _similarAds = value;
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDetails().then((value) {
      isFav = _details.isFavorite == "true" ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 450.h,
            child: Stack(children: [
              Container(
                height: 380.h,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: CachedNetworkImage(
                        imageUrl: _details.photos.isNotEmpty
                            ? _details.photos.first.photo
                            : "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SvgPicture.asset(
                          "assets/icons/contact_placeholder.svg",
                        ),
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          "assets/icons/contact_placeholder.svg",
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0),
                            Color.fromRGBO(0, 0, 0, 0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //height: 24.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 38.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30.h,
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
                    InkWell(
                      onTap: () async {
                        if (!isloadingfavorite) {
                          setState(() {
                            isloadingfavorite = true;
                          });
                          if (!isFav) {
                            await AdsController.addFavorite(
                              _details.id,
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).user.apiToken,
                            ).then((value) {
                              if (value ==
                                      "تم أضافه الاعلان الي المفضلة بنجاح" ||
                                  value ==
                                      "هذا الأعلان في المفضلة لديك بالفعل") {
                                setState(() {
                                  isFav = true;
                                  isloadingfavorite = false;
                                });
                              }
                              setState(() {
                                isloadingfavorite = false;
                              });
                            });
                          } else {
                            await AdsController.removeFavorite(
                              _details.id,
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).user.apiToken,
                            ).then((value) {
                              if (value ==
                                      "تم أزالة الاعلان من المفضلة بنجاح" ||
                                  value ==
                                      "هذا الأعلان غير موجود في المفضلة لديك ") {
                                setState(() {
                                  isFav = false;
                                  isloadingfavorite = false;
                                });
                              }
                              setState(() {
                                isloadingfavorite = false;
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        height: 30.h,
                        padding: EdgeInsets.all(5.h),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255, 255, 255, 0.1)),
                        child: FittedBox(
                          child: isloadingfavorite
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 590.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(37.r),
                    topRight: Radius.circular(37.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 22.h,
                      ),
                      DetailsHeaderWidget(
                        imagePath: _details.user.photo,
                        name:
                            "${_details.user.lastName} ${_details.user.firstName}",
                        cityName: _details.city.name,
                        createdAt: _details.createdAt,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Container(
                        height: 54.h,
                        width: 376.w,
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(251, 251, 251, 1),
                            borderRadius: BorderRadius.circular(9.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  resps = !resps;
                                });
                              },
                              child: Container(
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color:
                                      resps ? Colors.transparent : Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      width: 1,
                                      color: resps
                                          ? Colors.transparent
                                          : Colors.grey.shade300),
                                ),
                                child: Center(
                                  child: Text(
                                    "تفاصيل الاعلان",
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      color: resps
                                          ? const Color.fromRGBO(
                                              154, 161, 171, 1)
                                          : kprimaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  resps = !resps;
                                });
                              },
                              child: Container(
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color: resps
                                      ? Colors.transparent
                                      : !resps
                                          ? Colors.transparent
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    width: 1,
                                    color: !resps
                                        ? Colors.transparent
                                        : Colors.grey.shade300,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "الردود",
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      color: !resps
                                          ? const Color.fromRGBO(
                                              154, 161, 171, 1)
                                          : kprimaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Container(
                        //height: 320.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        padding: const EdgeInsets.all(3),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (resps)
                                  Container(
                                    height: 47.h,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: klightGreenColor,
                                        borderRadius:
                                            BorderRadius.circular(37.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: GoogleFonts.tajawal(
                                              color: kprimaryColor,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            controller: commentController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                hintText: "إضافه سؤال للمعلن",
                                                hintStyle: GoogleFonts.tajawal(
                                                  color: kprimaryColor
                                                      .withOpacity(.5),
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                border: InputBorder.none),
                                            onEditingComplete: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              await AdsController.addComment(
                                                token:
                                                    Provider.of<UserProvider>(
                                                            context,
                                                            listen: false)
                                                        .user
                                                        .apiToken,
                                                adId: _details.id.toString(),
                                                comment: commentController.text,
                                              ).then((value) {
                                                commentController.clear();
                                                if (value == "error") {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content:
                                                        Text("لم تنجح العملية"),
                                                    backgroundColor: Colors.red,
                                                  ));
                                                } else {
                                                  getDetails().then((value) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content: Text(
                                                          "تم إضافة الرد بنجاح"),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ));
                                                  });
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/addq.svg",
                                          color: kprimaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                if (!resps)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _details.title,
                                        style: GoogleFonts.tajawal(
                                          color: kprimaryColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "#${_details.id}",
                                        style: GoogleFonts.tajawal(
                                          color: kGreyColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                if (!resps)
                                  Text(
                                    _details.details,
                                    style: GoogleFonts.tajawal(
                                      color: Colors.grey.shade700,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                if (resps)
                                  SizedBox(
                                    height: 257.h,
                                    width: double.infinity,
                                    child: Column(children: [
                                      Flexible(
                                        child: _details.comments.isNotEmpty
                                            ? ListView.separated(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    _details.comments.length,
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SizedBox(
                                                    height: 5.h,
                                                  );
                                                },
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  CommentModel comment =
                                                      _details.comments[index];
                                                  return DetailsVerticaleWidget(
                                                      user: comment.user,
                                                      comment: comment.comment,
                                                      createdAt:
                                                          comment.createdAt);
                                                },
                                              )
                                            : Center(
                                                child: Text(
                                                  "لا يوجد ردود...",
                                                  style: GoogleFonts.tajawal(
                                                    color: kprimaryColor,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ]),
                                  ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  _launchUrl(Uri.parse(
                                      "tel://${_details.user.phoneNumber}"));
                                },
                                child: const PhoneCallWIdget()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        height: 54.h,
                        width: 376.w,
                        margin: EdgeInsets.symmetric(horizontal: 27.w),
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(251, 251, 251, 1),
                            borderRadius: BorderRadius.circular(9.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await FirebaseFirestore.instance
                                    .collection('chats')
                                    .where('users_uids', arrayContainsAny: [
                                      int.parse(Provider.of<UserProvider>(
                                              context,
                                              listen: false)
                                          .user
                                          .id),
                                      int.parse(_details.user.id)
                                    ])
                                    .where("title", isEqualTo: _details.title)
                                    .get()
                                    .then((value) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => value
                                                    .docs.isNotEmpty
                                                ? ChatView(
                                                    isNew: false,
                                                    title: _details.title,
                                                    docId: value.docs.first.id,
                                                    details: _details,
                                                  )
                                                : ChatView(
                                                    details: _details,
                                                    isNew: true,
                                                    title: _details.title,
                                                  )),
                                      );
                                    });
                              },
                              child: SizedBox(
                                height: 25.h,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/messages.svg",
                                      color: kprimaryColor,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      "خاص",
                                      style: GoogleFonts.tajawal(
                                        color: kprimaryColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 27.h,
                              color: Colors.grey.shade300,
                            ),
                            GestureDetector(
                              onTap: () {
                                _launchUrl(Uri.parse(
                                    "whatsapp://send?text=sample text&phone=${_details.user.phoneNumber}"));
                              },
                              child: SizedBox(
                                height: 25.h,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/whatsapp.svg",
                                      color: const Color.fromRGBO(
                                          120, 200, 104, 1),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      "واتساب",
                                      style: GoogleFonts.tajawal(
                                        color: const Color.fromRGBO(
                                            120, 200, 104, 1),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      if (_similarAds.isNotEmpty)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 21.w),
                          child: Text(
                            "اعلانات مشابهه",
                            style: GoogleFonts.tajawal(
                              color: kprimaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      if (_similarAds.isNotEmpty)
                        SizedBox(
                          height: 325.h,
                          child: ListView.separated(
                            padding: const EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemCount: _similarAds.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 20.w,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              Ad similarAd = _similarAds[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            DetailsView(adID: similarAd.id)),
                                  );
                                },
                                child: HomeVerticaleWidget(
                                  adId: similarAd.id,
                                  rate: similarAd.rate,
                                  catrgory: similarAd.subCategory.name,
                                  city: similarAd.city.name,
                                  createdAt: similarAd.createdAt,
                                  discription: similarAd.details,
                                  imagePath: similarAd.photos.isNotEmpty
                                      ? similarAd.photos.first.photo
                                      : "",
                                  isFavorite: similarAd.isFavorite == 'true'
                                      ? true
                                      : false,
                                  username: similarAd.user.firstName,
                                ),
                              );
                            },
                          ),
                        ),
                      SizedBox(
                        height: 50.h,
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
        ],
      ),
    );
  }
}
