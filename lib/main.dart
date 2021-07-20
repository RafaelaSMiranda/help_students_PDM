import 'package:flutter/material.dart';
import 'package:help_students/modulos/Cadastro/cadastroPage.dart';
import 'package:help_students/modulos/home/home_page.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/modulos/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // darkTheme: ThemeData.dark(),
        title: 'Help Students',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          accentColor: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashScreen(),
          "/login": (context) => LoginPage(),
          "/home": (context) => HomePage(),
          "/cadastro": (context) => CadastroPage(),
          // "/login": (context) => LoginPage(),
        });
  }
}
