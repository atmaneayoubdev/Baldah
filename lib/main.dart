import 'package:balda/helpers/user_provider.dart';
import 'package:balda/spash_screen.dart';
import 'package:balda/views/Add/views/adding_view.dart';
import 'package:balda/views/Add/views/main_add_view.dart';
import 'package:balda/views/advertisments/views/ads_main_view.dart';
import 'package:balda/views/favorite/views/favorite_view.dart';
import 'package:balda/views/messages/views/main_messages_view.dart';
import 'package:balda/views/notification/view/notifications_view.dart';
import 'package:balda/views/settings/views/change_password_view.dart';
import 'package:balda/views/settings/views/change_phone_view.dart';
import 'package:balda/views/settings/views/change_username_view.dart';
import 'package:balda/views/settings/views/main_setings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'translations/codegen_loader.g.dart';
import 'views/Auth/first_view.dart';
import 'views/Auth/phone_verification_view.dart';
import 'views/Auth/signin_view.dart';
import 'views/Auth/signup_view.dart';
import 'tab_view.dart';
import 'views/settings/views/raise_subscription.dart';
import 'package:provider/provider.dart';
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
        path: 'assets/translations/',
        supportedLocales: const [
          Locale('ar'),
        ],
        startLocale: const Locale('ar'),
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'بلدة',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: {
            FirstView.routeName: (context) => const FirstView(),
            SignInView.routeName: (context) => const SignInView(),
            SignUpView.routeName: (context) => const SignUpView(),
            PhoneVerificationView.routeName: ((context) =>
                const PhoneVerificationView()),
            TabView.routeName: (context) => const TabView(),
            MainSettingsView.routeName: ((context) => const MainSettingsView()),
            ChnagePasswordView.routeName: ((context) =>
                const ChnagePasswordView()),
            ChangePhoneView.routeName: ((context) => const ChangePhoneView()),
            ChangeUserView.routeName: ((context) => const ChangeUserView()),
            MainMessagesView.routeName: (context) => const MainMessagesView(),
            MainAdsView.routeName: (context) => const MainAdsView(),
            MainAddView.routeName: (context) => const MainAddView(),
            AddingView.routeName: (context) => const AddingView(),
            RaiseSubscription.routeName: (context) => const RaiseSubscription(),
            NotificationsView.routeName: (context) => const NotificationsView(),
            FavoriteView.routeName: (context) => const FavoriteView(),
          },
        ),
      ),
    );
  }
}
