import 'package:balda/constants.dart';
import 'package:balda/views/Add/widgets/grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SecondAdWidget extends StatefulWidget {
  const SecondAdWidget({Key? key}) : super(key: key);

  @override
  State<SecondAdWidget> createState() => _SecondAdWidgetState();
}

class _SecondAdWidgetState extends State<SecondAdWidget> {
  int selected = 0;
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
              "وش حابب تريد بيعه ؟",
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
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                  child: GridWidget(
                      name: "السيارات",
                      isSelected: selected == 0 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                  child: GridWidget(
                      name: "عقارات", isSelected: selected == 1 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                  child: GridWidget(
                      name: "اجهزه منزليه",
                      isSelected: selected == 2 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 3;
                    });
                  },
                  child: GridWidget(
                      name: "هواتف", isSelected: selected == 3 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 4;
                    });
                  },
                  child: GridWidget(
                      name: "اثاث منزل",
                      isSelected: selected == 4 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 5;
                    });
                  },
                  child: GridWidget(
                      name: "الموضه", isSelected: selected == 5 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 6;
                    });
                  },
                  child: GridWidget(
                      name: "حيوانات",
                      isSelected: selected == 6 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 7;
                    });
                  },
                  child: GridWidget(
                      name: "رياضه", isSelected: selected == 7 ? true : false),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 8;
                    });
                  },
                  child: GridWidget(
                      name: "العاب اطفال",
                      isSelected: selected == 8 ? true : false),
                ),
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
