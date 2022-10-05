import 'package:balda/constants.dart';
import 'package:balda/views/Add/widgets/grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ThirdAddView extends StatefulWidget {
  const ThirdAddView({Key? key}) : super(key: key);

  @override
  State<ThirdAddView> createState() => _ThirdAddViewState();
}

class _ThirdAddViewState extends State<ThirdAddView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              children: const [
                GridWidget(name: "سيارات للبيع", isSelected: true),
                GridWidget(name: "سيارات للايجار", isSelected: false),
                GridWidget(name: "قطع غيار", isSelected: false),
                GridWidget(name: "اكسسوارات", isSelected: false),
                GridWidget(name: "موتوسيكلات", isSelected: false),
                GridWidget(name: "شاحنات", isSelected: false),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
