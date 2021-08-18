import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/providers/login_EmailSenha.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EsqueciPage extends StatefulWidget {
  @override
  _EsqueciPageState createState() => _EsqueciPageState();
}

class _EsqueciPageState extends State<EsqueciPage> {
  TextEditingController _email = TextEditingController();

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
                bottom: size.height * 0.60,
                top: 0,
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
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Email Cadastrado",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(fontSize: 20),
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
                        label: "Enviar",
                        onPressed: () {
                          if (_email.text.isNotEmpty) {
                            SendPasswordResetEmail(_email.text);
                            resetUser(context);
                          } else {
                            Erro(context);
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

Erro(context) {
  Alert(
      context: context,
      title: "Informe o Email Cadastrado",
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

resetUser(context) {
  Alert(
      context: context,
      title: "Reset de senha enviando para o Email",
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
