import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoryWidget extends StatelessWidget {
  final String name;
  final String photo;
  const HomeCategoryWidget({
    Key? key,
    required this.name,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      width: 98.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: Stack(
        children: [
          SizedBox.expand(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: CachedNetworkImage(
                imageUrl: photo,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.black45,
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(19, 0, 0, 0),
                  Color.fromARGB(199, 0, 0, 0),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                  child: Text(
                name,
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
