import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class ForthAddWidget extends StatefulWidget {
  const ForthAddWidget({Key? key}) : super(key: key);

  @override
  State<ForthAddWidget> createState() => _ForthAddWidgetState();
}

class _ForthAddWidgetState extends State<ForthAddWidget> {
  var items = [
    'السعوديه بالكامل',
    'سيارات',
    'مرسيدس',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = "مرسيدس";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "المدينه",
                style: GoogleFonts.tajawal(
                  color: kprimaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  color: klightGreynColor,
                ),
                child: DropdownButton(
                  isExpanded: true,
                  value: "السعوديه بالكامل",
                  style: GoogleFonts.tajawal(
                    color: const Color.fromRGBO(105, 105, 105, 1),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 54.h),
              Text(
                "قم باضافه الصور",
                style: GoogleFonts.tajawal(
                  color: kprimaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 290.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 14.w,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
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
                  },
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Text(
                "مكان الاعلان",
                style: GoogleFonts.tajawal(
                  color: kprimaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  color: klightGreynColor,
                ),
                child: DropdownButton(
                  isExpanded: true,
                  value: "السعوديه بالكامل",
                  style: GoogleFonts.tajawal(
                    color: const Color.fromRGBO(105, 105, 105, 1),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  underline: const SizedBox(),
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 43.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 59.h,
                    width: 168.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      color: klightGreynColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: kprimaryColor,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "واتساب",
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
                    width: 10.w,
                  ),
                  Container(
                    height: 59.h,
                    width: 168.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.r),
                      color: klightGreynColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: kprimaryColor,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "واتساب",
                          style: GoogleFonts.tajawal(
                            color: kGreyColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                "الوصف",
                style: GoogleFonts.tajawal(
                  color: kGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                color: klightGreynColor,
                height: 223.h,
                width: double.infinity,
              ),
              SizedBox(
                height: 100.h,
              ),
            ]),
      ),
    );
  }
}
