import 'package:flutter/material.dart';
import 'package:balda/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdCircleWidget extends StatelessWidget {
  const AdCircleWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: 53,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(style: BorderStyle.solid, color: kprimaryColor),
      ),
      child: SizedBox.expand(
        child: CircleAvatar(
          foregroundImage: NetworkImage(imagePath),

          // child: CachedNetworkImage(
          //   imageUrl: imagePath,
          //   fit: BoxFit.cover,
          //   placeholder: (context, url) => SvgPicture.asset(
          //     "assets/icons/contact_placeholder.svg",
          //   ),
          //   errorWidget: (context, url, error) => SvgPicture.asset(
          //     "assets/icons/contact_placeholder.svg",
          //   ),
          // ),
        ),
      ),
    );
  }
}
