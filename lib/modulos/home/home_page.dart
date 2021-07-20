import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/create_table.widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryDrawer,
              ),
              accountName: Text("Maria Clara"),
              accountEmail: Text("mariaclara@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  AppImages.avatar,
                ),
              ),
            ),
            ListTile(
              title: new Text("Editar perfil"),
              leading: new Icon(Icons.account_circle),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Mudar tema"),
              leading: new Icon(Icons.settings),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Remover todas tarefas"),
              leading: new Icon(Icons.delete_forever),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Sair"),
              leading: new Icon(Icons.logout_outlined),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width,
              color: AppColors.primary,
            ),
            Positioned(
              bottom: size.height * 0.70,
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
              top: size.height * 0.15,
              child: CreateTableWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.grey[700],
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
          onPressed: () {
            _createTarefa(context);
          }),
    );
  }
}

_createTarefa(context) {
  {
    Alert(
        context: context,
        title: "Nova tarefa",
        content: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Text(
                "Matéria",
                textAlign: TextAlign.left,
                style: TextStyles.input,
              ),
              InputTextWidget(label: "", onChanged: (value) {}),
              Text(
                "Tarefa",
                textAlign: TextAlign.left,
                style: TextStyles.input,
              ),
              InputTextWidget(label: "", onChanged: (value) {}),
              Text(
                "Data",
                textAlign: TextAlign.left,
                style: TextStyles.input,
              ),
              InputTextWidget(label: "", onChanged: (value) {}),
              ButtonWidget(
                  label: "Cadastrar",
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  })
            ],
          ),
        ),
        buttons: []).show();
  }
}
