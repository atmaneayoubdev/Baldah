import 'package:balda/helpers/user_provider.dart';
import 'package:balda/views/favorite/views/favorite_view.dart';
import 'package:balda/views/messages/views/chat_view.dart';
import 'package:balda/views/messages/widgets/messages_widget.dart';
import 'package:balda/views/notification/view/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:balda/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class MainMessagesView extends StatefulWidget {
  const MainMessagesView({Key? key}) : super(key: key);
  static const String routeName = '/messages';

  @override
  State<MainMessagesView> createState() => _MainMessagesViewState();
}

class _MainMessagesViewState extends State<MainMessagesView> {
  bool isLoading = false;
  var chats = [];
  bool isMeFirst = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundgreyColor,
      body: Stack(
        children: [
          Container(
            height: 272.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(32, 127, 201, 1),
                  kprimaryColor,
                ],
              ),
            ),
            child: Column(children: [
              SizedBox(
                height: 52.h,
              ),
              Container(
                //height: 24.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        FavoriteView.routeName,
                      ),
                      child: Image.asset(
                        "assets/icons/heart.png",
                        height: 20.h,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "رسائل",
                        style: GoogleFonts.tajawal(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        NotificationsView.routeName,
                      ),
                      child: Image.asset(
                        "assets/icons/bell.png",
                        height: 25.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    "رسائل",
                    style: GoogleFonts.tajawal(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 19.h,
                    //width: 49.w,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        chats.length.toString(),
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: kGreyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 189.h,
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('chats')
                          .where('users_uids',
                              arrayContains: int.parse(
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .user
                                      .id))
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.docs.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 14.h,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot ds =
                                  snapshot.data!.docs.elementAt(index);
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ChatView(
                                            isNew: false,
                                            docId: ds.id,
                                            title: ds['title'].toString()),
                                      ),
                                    );
                                  },
                                  child: MessagesWidget(
                                    category: ds['category'],
                                    city: ds['city'],
                                    title: ds['title'],
                                    createdAt: intl.DateFormat('yyyy-MM-dd')
                                        .format(DateTime.parse(ds['createdAt']
                                            .toDate()
                                            .toString())),
                                    message: ds['lastMessage'],
                                    name: ds['users_uids'].first ==
                                            int.parse(Provider.of<UserProvider>(
                                                    context,
                                                    listen: false)
                                                .user
                                                .id)
                                        ? ds['users_names'][1]
                                        : ds['users_names'].first,
                                  ));
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('No messages...'),
                          );
                        }
                      }),
                  // child: ListView.separated(
                  //   padding: EdgeInsets.zero,
                  //   scrollDirection: Axis.vertical,
                  //   itemCount: chats.length,
                  //   separatorBuilder: (BuildContext context, int index) {
                  //     return SizedBox(
                  //       height: 14.h,
                  //     );
                  //   },
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return GestureDetector(
                  //         onTap: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) => ChatView(
                  //                   isNew: false,
                  //                   docId: chats[index].id,
                  //                   title: chats[index]['title'].toString()),
                  //             ),
                  //           );
                  //         },
                  //         child: MessagesWidget(
                  //           category: chats[index]['category'],
                  //           city: chats[index]['city'],
                  //           title: chats[index]['title'],
                  //           createdAt: intl.DateFormat('yyyy-MM-dd').format(
                  //               DateTime.parse(chats[index]['createdAt']
                  //                   .toDate()
                  //                   .toString())),
                  //           message: chats[index]['lastMessage'],
                  //           name: chats[index]['users_uids'].first ==
                  //                   int.parse(Provider.of<UserProvider>(context,
                  //                           listen: false)
                  //                       .user
                  //                       .id)
                  //               ? chats[index]['users_names'][1]
                  //               : chats[index]['users_names'].first,
                  //           // name: isMeFirst
                  //           //     ? chats[index]['user1_name'].toString()
                  //           //     : chats[index]['user2_name'].toString(),
                  //         ));
                  //   },
                  // ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
