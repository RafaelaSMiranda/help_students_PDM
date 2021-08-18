import 'dart:async';

import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    @override
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
                bottom: size.height * 0.40,
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                    child:
                        Image.asset(AppImages.logo, width: 550, height: 550))),
            Positioned(
              bottom: size.height * 0.35,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ALINHA AO CENTRO
                children: [
                  Text(
                    "HELP STUDENTS",
                    textAlign: TextAlign.center,
                    style: TextStyles.helpStudentsSplash,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: size.height * 0.15,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ALINHA AO CENTRO
                children: [
                  CircularProgressIndicator(
                    color: AppColors.grey,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5.0)),
                ],
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ALINHA AO CENTRO
                children: [
                  Text(
                    "VERSÃO 1.0",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
