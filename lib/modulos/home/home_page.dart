import 'package:help_students/modulos/components/appDrawer.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/tarefas/tarefa_list.dart';
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
      drawer: AppDrawer(),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.15,
              width: size.width,
              color: AppColors.primary,
            ),
            Positioned(
              bottom: size.height * 0.76,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      AppImages.avatar,
                      width: 100,
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 1,
                    color: Colors.grey[500],
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Text(
                        "Maria Clara",
                        style: TextStyles.name,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Sistemas de Informação",
                        style: TextStyles.curso,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Positioned(
                bottom: size.height * 0.65,
                left: size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome to Help Students",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Positioned(
              bottom: size.height * 0.38,
              left: 70,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.LISTA_TAREFAS);
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset(AppImages.concluida,
                      width: 300, height: 200)),
            ),
            Positioned(
                bottom: size.height * 0.35,
                left: 150,
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
                left: 80,
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
                left: 280,
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
              left: 30,
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
              left: 220,
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
