import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

//
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // PEGAR O TAMANHO DA TELA DO APARELHO

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
                top: 70,
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
