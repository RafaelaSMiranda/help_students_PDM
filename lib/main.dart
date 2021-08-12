import 'package:flutter/material.dart';
import 'package:help_students/views/cadastroPage.dart';
import 'package:help_students/views/home_page.dart';
import 'package:help_students/views/login_page.dart';
import 'package:help_students/views/editar_perfil_page.dart';
import 'package:help_students/views/splash_page.dart';
import 'views/cadastroPage.dart';
import 'package:http/http.dart';

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
          "/editPerfil": (context) => EditarPerfil(),
        });
  }
}
