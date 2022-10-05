import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {Key? key,
      required this.isSent,
      required this.message,
      required this.date})
      : super(key: key);
  final bool isSent;
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 242.w, minWidth: 0.w),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSent
              ? const Color.fromRGBO(244, 248, 254, 1)
              : klightGreynColor,
          borderRadius: BorderRadius.only(
            topLeft: isSent ? Radius.circular(0.r) : Radius.circular(15.r),
            topRight: isSent ? Radius.circular(15.r) : Radius.circular(0.r),
            bottomLeft: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          )),
      child: Flexible(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            message,
            maxLines: null,
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              color: kprimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: isSent ? Alignment.centerLeft : Alignment.centerRight,
            child: Text(
              date,
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: kGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
