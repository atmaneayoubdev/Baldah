import 'package:balda/controllers/public_controller.dart';
import 'package:balda/models/PublicModels/notofication_model.dart';
import 'package:balda/views/notification/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);
  static const String routeName = '/notif';

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  List<NotificationModel> _notifications = [];

  void getNotifications() async {
    await PublicContoller.getNotifications().then((value) {
      if (mounted) {
        setState(() {
          _notifications = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      getNotifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(32, 127, 201, 1),
            kprimaryColor,
          ],
        )),
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
            height: 150.h,
            decoration: const BoxDecoration(),
            width: double.infinity,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 27.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color.fromRGBO(255, 255, 255, 0.1),
                        borderRadius: BorderRadius.circular(5)),
                    child: const FittedBox(
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "الاشعارات",
                    style: GoogleFonts.tajawal(
                        fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kbackgroundgreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31.r),
                  topRight: Radius.circular(31.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        //height: 800.h,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 20.h),
                        decoration: BoxDecoration(
                          color: kbackgroundgreyColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(31.r),
                            topRight: Radius.circular(31.r),
                          ),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: _notifications.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            NotificationModel notification =
                                _notifications[index];
                            return NotificationWidget(
                              createdAt: notification.creationDate,
                              message: notification.message,
                              title: notification.title,
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
