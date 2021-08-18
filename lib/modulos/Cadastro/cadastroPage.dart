// @dart=2.3
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/providers/login_EmailSenha.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();

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
                bottom: size.height * 0.60,
                top: 70,
                left: 0,
                right: 0,
                child: Center(
                    child:
                        Image.asset(AppImages.logo, width: 250, height: 250))),
            Positioned(
                bottom: size.height * 0.45,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20))
                  ],
                )),
            Positioned(
                bottom: size.height * 0.35,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _senha,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
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
                          if ((validarEmail(_email.text) &&
                                  validarSenha(_senha.text)) !=
                              true) {
                            creatUserErro(context);
                          } else {
                            Future<String> result = registerWithEmailPassword(
                                _email.text, _senha.text);

                            creatUser(context);
                          }
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

validarEmail(String email) {
  print(email);
  if (email.length >= 10) {
    print("certo");
    return true;
  } else {
    print("errado");
    return false;
  }
}

validarSenha(String senha) {
  print(senha);
  if (senha.length >= 6 &&
      !senha.contains(RegExp(r'\W')) &&
      RegExp(r'\d+\w*\d+').hasMatch(senha)) {
    return true;
  } else {
    return false;
  }
}

creatUser(context) {
  Alert(
      context: context,
      title: "Usuario Cadastrado com Sucesso",
      content: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            ButtonWidget(
                label: "ok",
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                })
          ],
        ),
      ),
      buttons: []).show();
}

creatUserErro(context) {
  Alert(
      context: context,
      title: "Email Ivalido ou senha menor de 6 digitos",
      content: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            ButtonWidget(label: "ok", onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
      buttons: []).show();
}
