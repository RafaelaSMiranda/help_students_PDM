// @dart=2.3
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/providers/login_EmailSenha.dart';
import 'package:help_students/shared/themes/app_images.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _foto = TextEditingController();

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
                bottom: size.height * 0.55,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _nome,
                        decoration: InputDecoration(
                          labelText: "Nome",
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
                bottom: size.height * 0.45,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _foto,
                        decoration: InputDecoration(
                          labelText: "URL foto",
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
                bottom: size.height * 0.25,
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
              child: Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFF00875d),
                      Color(0XFF3ab394),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                    child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Cadastrar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        onPressed: () async {
                          if ((validarEmail(_email.text) &&
                                  validarSenha(_senha.text)) !=
                              true) {
                            creatUserErro(context);
                          } else {
                            await registerWithEmailPassword(
                                    _email.text, _senha.text)
                                .then((result) {
                              result.updateDisplayName(_nome.text);
                              result.updatePhotoURL(_foto.text);
                            });

                            creatUser(context);
                          }
                        })),
              ),
            ),
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
  if (email.length >= 10) {
    return true;
  } else {
    return false;
  }
}

validarSenha(String senha) {
  if (senha.length >= 6 &&
      !senha.contains(RegExp(r'\W')) &&
      RegExp(r'\d+\w*\d+').hasMatch(senha)) {
    return true;
  } else {
    return false;
  }
}

creatUser(context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text('Cadastro'),
            content: Text('Usuario cadastrado com cucesso'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ));
}

creatUserErro(context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text('Erro'),
            content: Text('Email iválido ou senha menor de 6 digitos'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
            ],
          ));
}
