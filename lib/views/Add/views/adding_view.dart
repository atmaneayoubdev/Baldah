import 'dart:developer';
import 'dart:io';

import 'package:balda/common/large_buton_icon.dart';
import 'package:balda/controllers/ads_controller.dart';
import 'package:balda/controllers/public_controller.dart';
import 'package:balda/helpers/user_provider.dart';
import 'package:balda/models/PublicModels/category.dart';
import 'package:balda/models/PublicModels/city.dart';
import 'package:balda/models/PublicModels/sub_catergory.dart';
import 'package:balda/views/Add/widgets/grid_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddingView extends StatefulWidget {
  const AddingView({Key? key}) : super(key: key);
  static const String routeName = '/adding_view';

  @override
  State<AddingView> createState() => _AddingViewState();
}

class _AddingViewState extends State<AddingView> {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  List<File> imgs = [];
  int _width = 1;
  bool _isAccepted = false;
  List<City> _cities = [];
  List<Category> _categories = [];
  List<SubCategory> _subCategories = [];
  bool isLoading = true;
  bool isWhatsapp = false;
  bool isDm = false;

  City _selectedCity = City(id: "0", name: "السعوديه بالكامل", createdAt: "0");
  Category _selectedCategory = Category(id: 0, name: '', photoPath: '');
  SubCategory _selectedSubCategory =
      SubCategory(id: 0, name: '', cratedAt: '', categoryId: 0);

  void getCitys() async {
    await PublicContoller.getCities().then((value) {
      setState(() {
        _cities = value;
        _cities.add(_selectedCity);
      });
    });
  }

  void getCataegories() async {
    await PublicContoller.getCategoties().then((value) {
      setState(() {
        _categories = value;
        isLoading = false;
      });
    });
  }

  void getSubCategories(int catID) async {
    await PublicContoller.getSubCategories(catID).then((value) {
      if (mounted) {
        setState(() {
          _subCategories = value;
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCitys();
    getCataegories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 303.h,
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
                    height: 50.h,
                  ),
                  Row(
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
                      SizedBox(width: 122.w),
                      Text(
                        "إضافه اعلان",
                        style: GoogleFonts.tajawal(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "ستتمكّن من بيع وشراء أي شيئ ممكن أن تتخيله",
                    style: GoogleFonts.tajawal(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$_width / 4",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 5.h,
                    width: 379.w,
                    child: Stack(
                      children: [
                        Container(
                          height: 5.h,
                          width: 379.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: const Color.fromRGBO(237, 237, 237, 0.5),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 5.h,
                          width: (379.w / 4) * _width,
                          constraints: BoxConstraints(maxWidth: 379.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: _width == 1
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 20.w),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع..تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عتتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                softWrap: true,
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _isAccepted,
                                    focusColor: kprimaryColor,
                                    checkColor: Colors.white,
                                    activeColor: kprimaryColor,
                                    onChanged: (value) {
                                      setState(() {
                                        _isAccepted = value!;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 0.w,
                                  ),
                                  Text(
                                    "الموافقه علي الشروط والحكام",
                                    style: GoogleFonts.tajawal(
                                      decoration: TextDecoration.underline,
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 100.h,
                              ),
                            ],
                          ),
                        ),
                      )
                    : _width == 2
                        ? SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 40.w),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 23.h,
                                  ),
                                  Text(
                                    "وش حابب تريد بيعه ؟",
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      color: kprimaryColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    softWrap: true,
                                  ),
                                  SizedBox(
                                    height: 23.h,
                                  ),
                                  StaggeredGrid.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 14.w,
                                    mainAxisSpacing: 18.h,
                                    children: [
                                      for (int i = 0;
                                          i < _categories.length - 1;
                                          i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedCategory =
                                                  _categories[i];
                                            });
                                            getSubCategories(
                                                _selectedCategory.id);
                                          },
                                          child: GridWidget(
                                            name: _categories[i].name,
                                            isSelected: _selectedCategory ==
                                                    _categories[i]
                                                ? true
                                                : false,
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 100.h,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : _width == 3
                            ? SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.h, horizontal: 40.w),
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 23.h,
                                      ),
                                      Text(
                                        "اختر الفئه الفرعيه",
                                        style: GoogleFonts.tajawal(
                                          fontSize: 16.sp,
                                          color: kprimaryColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        softWrap: true,
                                      ),
                                      SizedBox(
                                        height: 23.h,
                                      ),
                                      StaggeredGrid.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 14.w,
                                        mainAxisSpacing: 18.h,
                                        children: [
                                          for (int i = 0;
                                              i < _subCategories.length - 1;
                                              i++)
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedSubCategory =
                                                      _subCategories[i];
                                                });
                                              },
                                              child: GridWidget(
                                                name: _subCategories[i].name,
                                                isSelected:
                                                    _selectedSubCategory ==
                                                            _subCategories[i]
                                                        ? true
                                                        : false,
                                              ),
                                            ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 100.h,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Text(
                                          "اسم الاعلان",
                                          style: GoogleFonts.tajawal(
                                            color: kprimaryColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Container(
                                          height: 50.h,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.r),
                                            color: klightGreynColor,
                                          ),
                                          child: TextField(
                                            style: GoogleFonts.tajawal(
                                                fontSize: 18,
                                                color: Colors.black),
                                            controller: title,
                                            maxLines: 1, //or null
                                            decoration: const InputDecoration(
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Text(
                                          "المدينه",
                                          style: GoogleFonts.tajawal(
                                            color: kprimaryColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Container(
                                          height: 50.h,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.r),
                                            color: klightGreynColor,
                                          ),
                                          child: DropdownButton<City>(
                                            value: _selectedCity,
                                            isExpanded: true,
                                            style: GoogleFonts.tajawal(
                                              color: const Color.fromRGBO(
                                                  105, 105, 105, 1),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            underline: const SizedBox(),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: _cities.map((City item) {
                                              return DropdownMenuItem(
                                                value: item,
                                                child: Text(item.name),
                                              );
                                            }).toList(),
                                            onChanged: (City? newCity) {
                                              setState(() {
                                                _selectedCity = newCity!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 54.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Text(
                                          "قم باضافه الصور",
                                          style: GoogleFonts.tajawal(
                                            color: kprimaryColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      SizedBox(
                                        height: 290.h,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 40.w,
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await ImagePicker()
                                                      .pickMultiImage()
                                                      .then((value) {
                                                    setState(() {
                                                      for (var i = 0;
                                                          i < value!.length;
                                                          i++) {
                                                        imgs.add(
                                                          File(value[i].path),
                                                        );
                                                      }
                                                    });
                                                  });
                                                },
                                                child: const PhoyoWidget(),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              for (int i = 0;
                                                  i < imgs.length;
                                                  i++)
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.r),
                                                  ),
                                                  height: 247.h,
                                                  width: 181.w,
                                                  child: Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image.file(
                                                        imgs[i],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 31.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Text(
                                          "مكان الاعلان",
                                          style: GoogleFonts.tajawal(
                                            color: kprimaryColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Container(
                                          height: 50.h,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.r),
                                            color: klightGreynColor,
                                          ),
                                          child: DropdownButton<City>(
                                            value: _selectedCity,
                                            isExpanded: true,
                                            //hint: const Text("السعوديه بالكامل"),
                                            style: GoogleFonts.tajawal(
                                              color: const Color.fromRGBO(
                                                  105, 105, 105, 1),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            underline: const SizedBox(),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            // Array list of items
                                            items: _cities.map((City item) {
                                              return DropdownMenuItem(
                                                value: item,
                                                child: Text(item.name),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (City? newCity) {
                                              setState(() {
                                                _selectedCity = newCity!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 43.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "طرق التواصل",
                                              style: GoogleFonts.tajawal(
                                                color: kprimaryColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              "(بامكانك اختيار اكثر من خيار)",
                                              style: GoogleFonts.tajawal(
                                                color: kGreyColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: (() {
                                                setState(() {
                                                  isWhatsapp = !isWhatsapp;
                                                });
                                              }),
                                              child: Container(
                                                height: 59.h,
                                                width: 168.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.r),
                                                  color: klightGreynColor,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: isWhatsapp
                                                          ? Colors.grey
                                                          : kprimaryColor,
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text(
                                                      "واتساب",
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        color: kGreyColor,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isDm = !isDm;
                                                });
                                              },
                                              child: Container(
                                                height: 59.h,
                                                width: 168.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.r),
                                                  color: klightGreynColor,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: isDm
                                                          ? kprimaryColor
                                                          : Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text(
                                                      "خاص",
                                                      style:
                                                          GoogleFonts.tajawal(
                                                        color: kGreyColor,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 27.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Text(
                                          "الوصف",
                                          style: GoogleFonts.tajawal(
                                            color: kprimaryColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 40.h,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        color: klightGreynColor,
                                        height: 223.h,
                                        width: double.infinity,
                                        child: TextField(
                                          controller: details,
                                          maxLines: 10, //or null
                                          decoration:
                                              const InputDecoration.collapsed(
                                                  hintText: ""),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100.h,
                                      ),
                                    ]),
                              ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () async {
                    if (_width == 1) {
                      if (_isAccepted) {
                        setState(() {
                          _width = _width + 1;
                        });
                      }
                    } else if (_width == 2) {
                      if (_selectedCategory.id != 0) {
                        setState(() {
                          _width = _width + 1;
                        });
                      }
                    } else if (_width == 3) {
                      if (_selectedSubCategory.id != 0) {
                        setState(() {
                          _width = _width + 1;
                        });
                      }
                    } else {
                      log("am here");
                      if (title.text.isNotEmpty && details.text.isNotEmpty) {
                        setState(() {
                          isLoading = true;
                        });
                        await AdsController.createAd(
                          token:
                              Provider.of<UserProvider>(context, listen: false)
                                  .user
                                  .apiToken,
                          cityId: _selectedCity.id,
                          categorieId: _selectedCategory.id.toString(),
                          subCategorieId: _selectedSubCategory.id.toString(),
                          price: "122",
                          title: title.text,
                          details: details.text,
                          images: imgs,
                        ).then((value) {
                          setState(() {
                            isLoading = false;
                          });
                          if (value == "OK") {
                            showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                height: 506.h,
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(31.r),
                                    topRight: Radius.circular(31.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 350.h,
                                      child: Center(
                                        child: Stack(children: [
                                          Center(
                                            child: SvgPicture.asset(
                                              "assets/images/empty_add_back.svg",
                                              height: 350.h,
                                            ),
                                          ),
                                          Center(
                                            child: SvgPicture.asset(
                                              "assets/images/speaker.svg",
                                              height: 200.h,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    Center(
                                      child: Text(
                                        "تم انشاء اعلانك بنجاح",
                                        style: GoogleFonts.tajawal(
                                          fontSize: 22.sp,
                                          color: kprimaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 17.h),
                                    Center(
                                      child: Text(
                                        " اذهب الي اعلاناتي لمتابعت اعلانك",
                                        style: GoogleFonts.tajawal(
                                          fontSize: 18.sp,
                                          color: kGreyColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).then((value) => Navigator.pop(context));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "تأكد من المعلومات",
                                style: GoogleFonts.tajawal(
                                    fontSize: 16, color: Colors.white),
                              ),
                              backgroundColor: kprimaryColor,
                            ));
                          }
                        });
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
                    }
                  },
                  child: LargeButtonIcon(
                    isFinal: _width > 3 ? true : false,
                    name: _width > 3 ? "انشاء الاعلان" : "متابعه",
                  )),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
          if (isLoading)
            Container(
              decoration: const BoxDecoration(color: Colors.black45),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

class PhoyoWidget extends StatelessWidget {
  const PhoyoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 247.h,
      width: 181.w,
      child: DottedBorder(
        padding: EdgeInsets.zero,
        color: kGreyColor,
        strokeCap: StrokeCap.butt,
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: Radius.circular(16.r),
        dashPattern: const [10],
        child: Center(
          child: Container(
            height: 43.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: DottedBorder(
              padding: EdgeInsets.zero,
              color: kGreyColor,
              strokeCap: StrokeCap.butt,
              strokeWidth: 2,
              borderType: BorderType.Circle,
              radius: Radius.circular(16.r),
              dashPattern: const [10],
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: kGreyColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
