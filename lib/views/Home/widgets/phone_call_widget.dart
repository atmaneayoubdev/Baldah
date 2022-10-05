import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneCallWIdget extends StatelessWidget {
  const PhoneCallWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          //margin: EdgeInsets.only(top: 10.h),
          width: 45.w,
          height: 45.h,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(120, 200, 104, 1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/icons/call.svg",
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
