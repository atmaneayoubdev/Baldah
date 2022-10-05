// ignore_for_file: unused_field

import 'package:balda/controllers/ads_controller.dart';
import 'package:balda/controllers/public_controller.dart';
import 'package:balda/models/PublicModels/category.dart';
import 'package:balda/models/PublicModels/sub_catergory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../helpers/user_provider.dart';
import '../models/AdsModels/ad.dart';
import '../models/PublicModels/city.dart';
import 'package:provider/provider.dart';

class SettingsModelWidget extends StatefulWidget {
  const SettingsModelWidget({Key? key, required this.catID}) : super(key: key);
  final String catID;

  @override
  State<SettingsModelWidget> createState() => _SettingsModelWidgetState();
}

class _SettingsModelWidgetState extends State<SettingsModelWidget> {
  final List<Ad> _ads = [];
  List<City> _cities = [];
  List<Category> _categories = [];
  List<SubCategory> _subCategories = [];
  bool isLoading = true;

  City _selectedCity = City(id: "0", name: "السعوديه بالكامل", createdAt: "0");
  // ignore: prefer_final_fields
  Category _selectedCategory = Category(id: 0, name: '', photoPath: '');
  // ignore: prefer_final_fields
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
        _categories.add(_selectedCategory);
        if (widget.catID != "") {
          _selectedCategory = _categories.firstWhere(
            (x) => x.id.toString() == widget.catID,
          );
        }
        isLoading = false;
      });
    });
  }

  void getSubCategories(int catID) async {
    await PublicContoller.getSubCategories(catID).then((value) {
      if (mounted) {
        setState(() {
          _subCategories = value;
          _subCategories.add(_selectedSubCategory);
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
    if (widget.catID != "") {
      getSubCategories(int.parse(widget.catID));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 819.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(31.r),
          topRight: Radius.circular(31.r),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/settings2.svg",
                          color: kprimaryColor,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          ": تصفيه حسب ",
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "اعاده ضبط",
                      style: GoogleFonts.tajawal(
                        color: kGreyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "المدينه",
                  style: GoogleFonts.tajawal(
                    color: kprimaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 50.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: klightGreynColor,
                  ),
                  child: DropdownButton<City>(
                    value: _selectedCity,
                    isExpanded: true,
                    style: GoogleFonts.tajawal(
                      color: const Color.fromRGBO(105, 105, 105, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
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
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "الفئه الرئيسيه",
                  style: GoogleFonts.tajawal(
                    color: kprimaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: klightGreynColor,
                  ),
                  child: widget.catID != ""
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _selectedCategory.name,
                            style: GoogleFonts.tajawal(
                              color: const Color.fromRGBO(105, 105, 105, 1),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : DropdownButton<Category>(
                          isExpanded: true,
                          value: _selectedCategory,
                          style: GoogleFonts.tajawal(
                            color: const Color.fromRGBO(105, 105, 105, 1),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          underline: const SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: _categories.map((Category category) {
                            return DropdownMenuItem(
                                value: category, child: Text(category.name));
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (Category? newCategory) {
                            setState(() {
                              isLoading = true;
                              _selectedCategory = newCategory!;
                            });
                            getSubCategories(newCategory!.id);
                          },
                        ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "الفئه الثانوية",
                  style: GoogleFonts.tajawal(
                    color: kprimaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 50.h,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: klightGreynColor,
                  ),
                  child: DropdownButton<SubCategory>(
                    isExpanded: true,
                    value: _selectedSubCategory,
                    style: GoogleFonts.tajawal(
                      color: const Color.fromRGBO(105, 105, 105, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: _subCategories.map((SubCategory subCategory) {
                      return DropdownMenuItem(
                        value: subCategory,
                        child: Text(subCategory.name),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (SubCategory? newValue) {
                      setState(() {
                        _selectedSubCategory = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 200.h),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await AdsController.adsFilter(
                          Provider.of<UserProvider>(
                            context,
                            listen: false,
                          ).user.apiToken,
                          _selectedCity.id,
                          _selectedCategory.id.toString(),
                          _selectedSubCategory.id.toString(),
                        ).then((value) {
                          Navigator.pop(context, {
                            'adsList': value,
                            'subCategory': _selectedSubCategory
                          });
                        });
                      },
                      child: Container(
                        width: 106.w,
                        height: 53.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27.r),
                          color: kprimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "البحث",
                            style: GoogleFonts.tajawal(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 106.w,
                        height: 53.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27.r),
                          color: klightGreynColor,
                        ),
                        child: Center(
                          child: Text(
                            "إلغاء",
                            style: GoogleFonts.tajawal(
                              color: kprimaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(77, 0, 0, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31.r),
                  topRight: Radius.circular(31.r),
                ),
              ),
              child: const Center(
                  child: CircularProgressIndicator(
                color: kprimaryColor,
              )),
            )
        ],
      ),
    );
  }
}
