import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/sign_up_screen/sign_up_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String testScreen = '/test_screen';
  static const String albumTestScreen = '/album_test_screen';
  static const String articleWebView = '/article_web_view';
  static const String editPaymentMethod = '/editPaymentMethod';
  static const String notificationScreen = '/notificationScreen';

  static const String accountSettingsScreen = '/account_settings_screen';
  static const String deleteAccountScreen = '/delete_account_screen';
  static const String albumScreen = '/album_screen';
  static const String buyPPDScreen = '/buy_ppd_screen';
  static const String buyZawiyaScreen = '/buy_zawiya_screen';
  static const String confirmAndSubscribeScreen =
      '/confirm_and_subscribe_screen';
  static const String creditTransferFriendScreen =
      '/creditTransferFriendScreen';
  static const String homeScreen = '/homeScreen';
  static const String libraryScreen = '/libraryScreen';
  static const String mainPlayerScreen = '/mainPlayerScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String pinnedItemDetailScreen = '/pinnedItemDetailScreen';
  static const String profileScreen = '/profileScreen';
  static const String upgradeCancelMemberShipScreen =
      '/upgradeCancelMemberShipScreen';
  static const String walletScreen = '/walletScreen';
  static const String signUp = '/signUp';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    signUp: (context) => SignUpScreen(),

  };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    print("SettingsName: ${settings.name}");
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      default:
        return null;
    }
  }
}
