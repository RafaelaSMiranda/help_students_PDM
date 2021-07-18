import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

//
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        Image.asset(AppImages.logo, width: 350, height: 350))),
            Positioned(
              bottom: size.height * 0.50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyles.login,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: size.height * 0.35,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    InputTextWidget(label: "Usuário", onChanged: (value) {})
                  ],
                )),
            Positioned(
                bottom: size.height * 0.25,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    InputTextWidget(label: "Senha", onChanged: (value) {})
                  ],
                )),
            Positioned(
                bottom: size.height * 0.15,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    ButtonWidget(
                        label: "Entrar",
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
