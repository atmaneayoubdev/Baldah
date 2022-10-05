import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';

class CategoryShowWidget extends StatelessWidget {
  const CategoryShowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      width: 216.w,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: kborderColor),
        borderRadius: BorderRadius.circular(11.r),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/montery.png"),
        ),
      ),
    );
  }
}
