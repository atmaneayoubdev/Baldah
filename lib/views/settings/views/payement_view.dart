import 'dart:developer';
import 'package:balda/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayementView extends StatefulWidget {
  const PayementView({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<PayementView> createState() => _PayementViewState();
}

class _PayementViewState extends State<PayementView> {
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 51.h, horizontal: 22.w),
            height: 326.h,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(32, 127, 201, 1),
                kprimaryColor,
              ],
            )),
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
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
                SizedBox(width: 100.w),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "بوابة الدفع",
                    style: GoogleFonts.tajawal(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 798.h,
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 30.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(31.r),
                      topRight: Radius.circular(31.r)),
                ),
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                  initialOptions: options,
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    log(url.toString());
                    if (url!.toString().contains("Result=Failure")) {
                      Navigator.of(context).pop();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "لم يتم تفعيل الشتراك يرجى التأكد من معلوماتك",
                            style: GoogleFonts.tajawal(
                                fontSize: 18.sp, color: Colors.white),
                          ),
                        ),
                      );
                    }
                    if (url.toString().contains("Result=Successful")) {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "تم تفعيل الاشتراك بنجاح",
                            style: GoogleFonts.tajawal(
                                fontSize: 18.sp, color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  androidOnPermissionRequest:
                      (controller, origin, resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                    var uri = navigationAction.request.url!;

                    if (![
                      "http",
                      "https",
                      "file",
                      "chrome",
                      "data",
                      "javascript",
                      "about"
                    ].contains(uri.scheme)) {}

                    return NavigationActionPolicy.ALLOW;
                  },
                  onLoadStop: (controller, url) async {},
                  onLoadError: (controller, url, code, message) {
                    log(message);
                  },
                  onProgressChanged: (controller, progress) {
                    log('  WebView is loading (progress : $progress%)   ');
                  },
                  onUpdateVisitedHistory: (controller, url, androidIsReload) {
                    //log(url.toString());
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    log(consoleMessage.toString());
                  },
                  onReceivedServerTrustAuthRequest:
                      (controller, challenge) async {
                    log(challenge.toString());
                    return ServerTrustAuthResponse(
                      action: ServerTrustAuthResponseAction.PROCEED,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: InAppWebView(
    //     initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
    //     initialOptions: options,
    //     onWebViewCreated: (controller) {
    //       webViewController = controller;
    //     },
    //     onLoadStart: (controller, url) {
    //       log(url.toString());
    //       if (url!.toString().contains("Result=Failure")) {
    //         Navigator.of(context).pop();

    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             backgroundColor: Colors.red,
    //             content: Text(
    //               "لم يتم تفعيل الشتراك يرجى التأكد من معلوماتك",
    //               style:
    //                   GoogleFonts.tajawal(fontSize: 18.sp, color: Colors.white),
    //             ),
    //           ),
    //         );
    //       }
    //       if (url.toString().contains("Result=Successful")) {
    //         Navigator.pop(context);

    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             backgroundColor: Colors.green,
    //             content: Text(
    //               "تم تفعيل الاشتراك بنجاح",
    //               style:
    //                   GoogleFonts.tajawal(fontSize: 18.sp, color: Colors.white),
    //             ),
    //           ),
    //         );
    //       }
    //     },
    //     androidOnPermissionRequest: (controller, origin, resources) async {
    //       return PermissionRequestResponse(
    //           resources: resources,
    //           action: PermissionRequestResponseAction.GRANT);
    //     },
    //     shouldOverrideUrlLoading: (controller, navigationAction) async {
    //       var uri = navigationAction.request.url!;

    //       if (![
    //         "http",
    //         "https",
    //         "file",
    //         "chrome",
    //         "data",
    //         "javascript",
    //         "about"
    //       ].contains(uri.scheme)) {}

    //       return NavigationActionPolicy.ALLOW;
    //     },
    //     onLoadStop: (controller, url) async {},
    //     onLoadError: (controller, url, code, message) {
    //       log(message);
    //     },
    //     onProgressChanged: (controller, progress) {
    //       log('  WebView is loading (progress : $progress%)   ');
    //     },
    //     onUpdateVisitedHistory: (controller, url, androidIsReload) {
    //       //log(url.toString());
    //     },
    //     onConsoleMessage: (controller, consoleMessage) {
    //       log(consoleMessage.toString());
    //     },
    //     onReceivedServerTrustAuthRequest: (controller, challenge) async {
    //       log(challenge.toString());
    //       return ServerTrustAuthResponse(
    //         action: ServerTrustAuthResponseAction.PROCEED,
    //       );
    //     },
    //   ),
    // );
  }
}
