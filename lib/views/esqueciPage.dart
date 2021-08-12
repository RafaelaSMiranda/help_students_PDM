import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/widgets/button_widget.dart';
import 'package:help_students/widgets/input_text_widget.dart';
import 'package:help_students/views/login_page.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

class EsqueciPage extends StatefulWidget {
  const EsqueciPage({Key? key}) : super(key: key);

  @override
  _EsqueciPageState createState() => _EsqueciPageState();
}

class _EsqueciPageState extends State<EsqueciPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    "Recuperação de senha",
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
                    InputTextWidget(
                        label: "Email Cadastrado",
                        onChanged: (value) {},
                        senha: false)
                  ],
                )),
            Positioned(
                bottom: size.height * 0.15,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    ButtonWidget(
                        label: "Enviar",
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        })
                  ],
                )),
            Positioned(
              bottom: size.height * 0.10,
              left: 50,
              right: 50,
              child: TextButton(
                  child: Text('< Voltar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
