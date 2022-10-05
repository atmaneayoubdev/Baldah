import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({Key? key, required this.name, required this.isSelected})
      : super(key: key);
  final String name;
  final bool isSelected;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 171.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        color: widget.isSelected ? kprimaryColor : klightGreynColor,
      ),
      child: Center(
        child: Text(
          widget.name,
          style: GoogleFonts.tajawal(
            fontSize: 16.sp,
            color: widget.isSelected ? Colors.white : kGreyColor,
            fontWeight: FontWeight.normal,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}
