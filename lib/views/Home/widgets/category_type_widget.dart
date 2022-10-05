import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class CategoryTypeWidget extends StatefulWidget {
  const CategoryTypeWidget(
      {Key? key, required this.selected, required this.name})
      : super(key: key);
  final bool selected;
  final String name;

  @override
  State<CategoryTypeWidget> createState() => _CategoryTypeWidgetState();
}

class _CategoryTypeWidgetState extends State<CategoryTypeWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(43.r),
          color: widget.selected ? kprimaryColor : Colors.grey.shade100),
      child: Center(
        child: Text(
          widget.name,
          style: GoogleFonts.tajawal(
            fontSize: 14.sp,
            color: widget.selected ? Colors.white : kprimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
