import 'package:help_students/modulos/components/appDrawer.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/create_table.widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//
class HomePage extends StatelessWidget {
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
                bottom: size.height * 0.55,
                child: Column(
                  children: [
                    ButtonTheme(
                      height: 70.0,
                      child: RaisedButton(
                        onPressed: () => {
                          Navigator.of(context).pushNamed(
                            AppRoutes.LISTA_TAREFAS,
                          ),
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.green[600],
                      ),
                    ),
                  ],
                )),
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
    Alert(
        context: context,
        title: "Tem certeza que deseja remover todas as tarefas?",
        content: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              ButtonWidget(
                  label: "Remover",
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  })
            ],
          ),
        ),
        buttons: []).show();
  }
}
