import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstAddWidget extends StatefulWidget {
  const FirstAddWidget({Key? key}) : super(key: key);

  @override
  State<FirstAddWidget> createState() => _FirstAddWidgetState();
}

class _FirstAddWidgetState extends State<FirstAddWidget> {
  bool _isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع..تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عتتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع.تتعهد بعدم الإعلان عن أي سلعة ممنوعة بالموقع",
              style: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: kGreyColor,
                fontWeight: FontWeight.normal,
              ),
              softWrap: true,
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              children: [
                Checkbox(
                  value: _isAccepted,
                  focusColor: kprimaryColor,
                  checkColor: Colors.white,
                  activeColor: kprimaryColor,
                  onChanged: (value) {
                    setState(() {
                      _isAccepted = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 0.w,
                ),
                Text(
                  "الموافقه علي الشروط والحكام",
                  style: GoogleFonts.tajawal(
                    decoration: TextDecoration.underline,
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  softWrap: true,
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
