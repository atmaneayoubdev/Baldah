// import 'package:balda/views/advertisments/widgets/ads_message_widget.dart';
// import 'package:balda/views/messages/views/chat_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../constants.dart';

// class AdsMessagesView extends StatefulWidget {
//   const AdsMessagesView({Key? key}) : super(key: key);
//   static const String routeName = '/ad_mesages';

//   @override
//   State<AdsMessagesView> createState() => _AdsMessagesViewState();
// }

// class _AdsMessagesViewState extends State<AdsMessagesView> {
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromRGBO(32, 127, 201, 1),
//             kprimaryColor,
//           ],
//         )),
//         child: Column(children: [
//           Container(
//             alignment: Alignment.topRight,
//             padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
//             height: 150.h,
//             decoration: const BoxDecoration(),
//             width: double.infinity,
//             child: GestureDetector(
//               onTap: () => Navigator.of(context).pop(),
//               child: Container(
//                 height: 27.h,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     color: const Color.fromRGBO(255, 255, 255, 0.1),
//                     borderRadius: BorderRadius.circular(5)),
//                 child: const FittedBox(
//                   child: Icon(
//                     Icons.arrow_right_alt,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: kbackgroundgreyColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(31.r),
//                   topRight: Radius.circular(31.r),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       //height: 800.h,
//                       padding: EdgeInsets.only(top: 20.h),
//                       decoration: BoxDecoration(
//                         color: kbackgroundgreyColor,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(31.r),
//                           topRight: Radius.circular(31.r),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             padding: EdgeInsets.symmetric(vertical: 11.h),
//                             decoration: const BoxDecoration(),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 17.w,
//                                     ),
//                                     Text(
//                                       "للبيع" ":",
//                                       style: GoogleFonts.tajawal(
//                                         fontSize: 14.sp,
//                                         color: kGreyColor,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Text(
//                                       "مرسيدس شبح 320S لارج امريكي",
//                                       style: GoogleFonts.tajawal(
//                                         fontSize: 14.sp,
//                                         color: kprimaryColor,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               width: double.infinity,
//                               padding: EdgeInsets.only(
//                                   right: 20.w, left: 20.w, top: 20.h),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(31.r),
//                                   topRight: Radius.circular(31.r),
//                                 ),
//                               ),
//                               child: ListView.separated(
//                                 padding: EdgeInsets.zero,
//                                 shrinkWrap: true,
//                                 itemCount: messages.length,
//                                 separatorBuilder:
//                                     (BuildContext context, int index) {
//                                   return SizedBox(
//                                     height: 13.h,
//                                   );
//                                 },
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context)
//                                             .pushNamed(ChatView.routeName);
//                                       },
//                                       child: const AdsMesssageWidget());
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
