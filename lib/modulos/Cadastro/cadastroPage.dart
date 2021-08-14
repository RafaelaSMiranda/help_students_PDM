import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/auth/sing_up_service.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/shared/themes/app_images.dart';

class CadastroPage extends StatefulWidget {

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _cursoInputcontroller = TextEditingController();
  TextEditingController _emailInputcontroller = TextEditingController();
  TextEditingController _senhaInputcontroller = TextEditingController();

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
                    child: Image.asset(AppImages.imgload,
                        width: 300, height: 300))),
            Positioned(
                bottom: size.height * 0.45,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextField(
                      controller: _cursoInputcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Curso'),
                    )
                  ],
                )),
            Positioned(
                bottom: size.height * 0.35,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextField(
                      controller: _emailInputcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'email'),
                    )
                  ],
                )),
            Positioned(
                bottom: size.height * 0.25,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextField(
                      controller: _senhaInputcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Senha'),
                    )
                  ],
                )),
            Positioned(
                bottom: size.height * 0.15,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    ButtonWidget(
                        label: "Criar",
                        onPressed: () {
                          print("CHEGUEI Onpress");
                          _doSignUp();
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

  void _doSignUp() {
    SignUpServices()
        .signUp(_emailInputcontroller.text, _senhaInputcontroller.text);
  }
}
