import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pak_saaf/screens/splash_screen/splash_screen.dart';
import 'package:pak_saaf/themes/app_theme.dart';

void main() async {

  runApp(const MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp();



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: appThemeDark(),
      themeMode: ThemeMode.system,
      theme: appTheme(),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      home: SplashScreen(),
    );
  }
}
