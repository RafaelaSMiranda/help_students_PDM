import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_students/modulos/Cadastro/cadastroPage.dart';
import 'package:help_students/modulos/EsqueciSenha/esqueciPage.dart';
import 'package:help_students/modulos/home/home_page.dart';
import 'package:help_students/providers/login_EmailSenha.dart';
import 'package:help_students/providers/login_controle.dart';
import 'package:help_students/providers/usuario.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';

User userLogado;

//
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = LoginControle();

    TextEditingController _email = TextEditingController();
    TextEditingController _senha = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(AppImages.logo),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
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
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
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
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EsqueciPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
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
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset(AppImages.singin),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () async {
                    if (_email.text.isNotEmpty && _senha.text.isNotEmpty) {
                      await signInWithEmailPassword(
                        _email.text,
                        _senha.text,
                      ).then((result) {
                        userLogado = result;
                        final user = Usuario(
                            name: userLogado.displayName,
                            photoURL: userLogado.photoURL,
                            id: userLogado.uid,
                            email: userLogado.email);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => HomePage(user)),
                        );
                      }).catchError((error) {
                        _falhaLogin(context);
                      });
                    } else
                      _loginErro(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFF000000),
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
                        "Login com Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset(AppImages.google),
                          height: 38,
                          width: 38,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    controller.googleSignIn(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_loginErro(context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text('Erro'),
            content: Text('Email ou senha inválidos'),
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

_falhaLogin(context) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text('Ops!'),
            content: Text(
                'Desculpe, houve um erro. Provavelmente login e/ou senha incorretos.'),
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
