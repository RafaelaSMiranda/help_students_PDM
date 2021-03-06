import 'package:help_students/modulos/Cadastro/cadastroPage.dart';
import 'package:help_students/modulos/EsqueciSenha/esqueciPage.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
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
                  children: [InputTextWidget(label: "Usuário", senha: false)],
                )),
            Positioned(
                bottom: size.height * 0.25,
                left: 50,
                right: 50,
                child: Column(
                  children: [InputTextWidget(label: "Senha", senha: true)],
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
            Positioned(
                bottom: size.height * 0.05,
                left: 25,
                right: 25,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EsqueciPage()),
                          );
                        },
                        child: Text("* Esqueci a Senha"))
                  ],
                )),
            Positioned(
              bottom: size.height * 0.10,
              left: 85,
              right: 85,
              child: TextButton(
                  child: Text('+ Criar Conta'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroPage()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
