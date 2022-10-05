import 'dart:developer';

import 'package:balda/helpers/user_provider.dart';
import 'package:balda/models/AdsModels/ad_details.dart';
import 'package:balda/models/PublicModels/chat_model.dart';
import 'package:balda/models/PublicModels/message_model.dart';
import 'package:balda/views/messages/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class ChatView extends StatefulWidget {
  const ChatView(
      {Key? key,
      this.docId,
      required this.isNew,
      required this.title,
      this.details})
      : super(key: key);
  final String? docId;
  final bool isNew;
  final String title;
  final AdDetails? details;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool isLoading = true;
  ScrollController _scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  late CollectionReference chatCol;
  late CollectionReference messagesRef;
  String docid = '';
  bool isNew = true;

  void sendMessage() async {
    if (!isNew) {
      log("this is old");
      if (widget.docId != null) {
        setState(() {
          docid = widget.docId!;
        });
      }
      final message = controller.text.trim();
      controller.clear();
      FocusScope.of(context).unfocus();
      messagesRef =
          FirebaseFirestore.instance.collection('chats/$docid/messages');
      final newMessage = MessageModel(
        uid: int.parse(
            Provider.of<UserProvider>(context, listen: false).user.id),
        //uid: 1,
        message: message,
        createdOn: DateTime.now().toUtc(),
      );
      await messagesRef.add(newMessage.toJson());
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    } else if (isNew) {
      log("this is new");
      final message = controller.text.trim();
      controller.clear();
      FocusScope.of(context).unfocus();
      chatCol = FirebaseFirestore.instance.collection('chats');
      final newChat = ChatModel(
        usersUids: [
          int.parse(Provider.of<UserProvider>(context, listen: false).user.id),
          int.parse(widget.details!.user.id)
        ],
        usersNames: [
          "${Provider.of<UserProvider>(context, listen: false).user.lastName} ${Provider.of<UserProvider>(context, listen: false).user.firstName}",
          "${widget.details!.user.firstName} ${widget.details!.user.lastName}"
        ],
        category: widget.details!.category.name,
        city: widget.details!.city.name,
        createdAt: DateTime.now().toUtc(),
        title: widget.title,
        lastMessage: message,
      );
      await chatCol.add(newChat.toJson()).then((value1) async {
        messagesRef = FirebaseFirestore.instance
            .collection('chats/${value1.id}/messages');
        final newMessage = MessageModel(
          uid: int.parse(
              Provider.of<UserProvider>(context, listen: false).user.id),
          //uid: 1,
          message: message,
          createdOn: DateTime.now(),
        );
        await messagesRef.add(newMessage.toJson()).then((value) {
          setState(() {
            isNew = false;
            docid = value1.id;
            log(value1.id);
          });
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isNew = widget.isNew;
    if (widget.docId != null) {
      docid = widget.docId!;
    }

    controller = TextEditingController();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
            child: GestureDetector(
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
                      padding: EdgeInsets.only(top: 20.h),
                      decoration: BoxDecoration(
                        color: kbackgroundgreyColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(31.r),
                          topRight: Radius.circular(31.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 11.h),
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 17.w,
                                    ),
                                    Text(
                                      "للبيع" ":",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 14.sp,
                                        color: kGreyColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      widget.title,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 14.sp,
                                        color: kprimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (isNew) const Spacer(),
                          if (!isNew)
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                padding: EdgeInsets.only(
                                    right: 20.w, left: 20.w, top: 0.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(31.r),
                                    topRight: Radius.circular(31.r),
                                  ),
                                ),
                                child: !isNew
                                    ? StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('chats/$docid/messages')
                                            .orderBy("createdOn")
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              if (_scrollController
                                                  .hasClients) {
                                                _scrollController.animateTo(
                                                    _scrollController.position
                                                        .maxScrollExtent,
                                                    duration: const Duration(
                                                        milliseconds: 1),
                                                    curve: Curves.easeInOut);
                                              }
                                            });
                                            return ListView.separated(
                                              reverse: false,
                                              controller: _scrollController,
                                              padding: EdgeInsets.only(
                                                  top: 10.h, bottom: 10.h),
                                              shrinkWrap: false,
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(
                                                  height: 10.h,
                                                );
                                              },
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                DocumentSnapshot ds = snapshot
                                                    .data!.docs
                                                    .elementAt(index);
                                                return Align(
                                                  alignment: ds['uid'] ==
                                                          int.parse(Provider.of<
                                                                      UserProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .user
                                                              .id)
                                                      ? Alignment.centerRight
                                                      : Alignment.centerLeft,
                                                  child: ChatWidget(
                                                    isSent: ds['uid'] ==
                                                            int.parse(Provider.of<
                                                                        UserProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .user
                                                                .id)
                                                        ? true
                                                        : false,
                                                    message: ds['message']
                                                        .toString(),
                                                    date: intl.DateFormat(
                                                            'yyyy-MM-dd – kk:mm')
                                                        .format(DateTime.parse(
                                                            ds['createdOn']
                                                                .toDate()
                                                                .toString())),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            return const Center(
                                              child: Text('No messages...'),
                                            );
                                          }
                                        })
                                    : const SizedBox(),
                              ),
                            ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 70.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(32, 127, 201, 1),
                                  kprimaryColor,
                                ],
                              ),
                              //borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: kprimaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  enableFeedback:
                                      controller.text == "" ? false : true,
                                  onPressed: () {
                                    sendMessage();
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: controller.text == ""
                                        ? Colors.white54
                                        : Colors.white,
                                    textDirection: TextDirection.ltr,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: klightBlueColor,
                                    borderRadius: BorderRadius.circular(11.r),
                                    border: Border.all(
                                      color: kprimaryColor,
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.send,
                                    controller: controller,
                                    maxLines: null,
                                    expands: false,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 20.sp,
                                      color: kprimaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle:
                                          TextStyle(color: Colors.white30),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        controller;
                                      });
                                    },
                                    onSubmitted: (String key) async {},
                                  ),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
