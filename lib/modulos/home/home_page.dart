import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_students/modulos/components/appDrawer.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/tarefas/tarefa_list.dart';
import 'package:help_students/providers/sing_out.dart';
import 'package:help_students/providers/usuario.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//
class HomePage extends StatelessWidget {
  get child => null;
  final Usuario _user;
  HomePage(this._user);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // PEGAR O TAMANHO DA TELA DO APARELHO
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.logout_outlined),
            onPressed: () {
              _sair(context);
            },
          ),
        ],
      ),
      drawer: AppDrawer(_user),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.16,
              width: size.width,
              color: AppColors.primary,
            ),
            Positioned(
              bottom: size.height * 0.76,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 85,
                    width: 10,
                    color: AppColors.primary,
                  ),
                  Container(
                      width: 85.0,
                      height: 90.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: new NetworkImage(_user.photoURL)))),
                  Container(
                    height: 90,
                    width: 0,
                    color: Colors.grey[500],
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        _user.name,
                        style: TextStyles.name,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        _user.email,
                        style: TextStyles.curso,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Positioned(
                bottom: size.height * 0.65,
                left: size.width * 0.12,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to Help Students",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
              bottom: size.height * 0.37,
              left: size.width * 0.3,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.LISTA_TAREFAS);
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset(AppImages.concluida,
                      width: 200, height: 200)),
            ),
            Positioned(
                bottom: size.height * 0.38,
                left: size.width * 0.35,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Todas as Tarefas",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
                bottom: size.height * 0.15,
                left: size.width * 0.20,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Tarefas Abertas",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
                bottom: size.height * 0.15,
                left: size.width * 0.65,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Tarefas Concluidas",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
              bottom: size.height * 0.20,
              left: size.width * 0.12,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => ListaTarefas('abertas')),
                    );
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset(AppImages.list, width: 200, height: 100)),
            ),
            Positioned(
              bottom: size.height * 0.20,
              left: size.width * 0.55,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => ListaTarefas('concluidas')),
                    );
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset(AppImages.open, width: 200, height: 100)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add_task),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.CADASTRO_TAREFA,
            );
          }),
    );
  }
}

_sair(context) {
  {
    Alert(
        context: context,
        title: "Tem certeza que deseja sair?",
        content: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              ButtonWidget(
                  label: "Sair",
                  onPressed: () {
                    Authentication.signOut();
                    Navigator.pushNamed(context, '/login');
                  })
            ],
          ),
        ),
        buttons: []).show();
  }
}

_removerTodasTarefas(context) {
  {
    AlertDialog(
      title: Text('Remover tarefa'),
      content: Text('Você tem certeza que deseja remover esta tarefa?'),
      actions: <Widget>[
        TextButton(
          child: Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: Text('Sim'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
