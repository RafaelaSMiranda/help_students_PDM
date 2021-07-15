import 'package:flutter/material.dart';
import 'package:help_students/modulos/home/home_page.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/modulos/splash/splash_page.dart';
import 'package:help_students/shared/themes/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Help Students',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: "/login",
        routes: {
          "/splash": (context) => SplashPage(),
          "/login": (context) => LoginPage(),
          "/home": (context) => HomePage(),
          // "/login": (context) => LoginPage(),
        });
  }
}
