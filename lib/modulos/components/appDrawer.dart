import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () {
              Navigator.pushNamed(context, '/editPerfil');
            },
          ),
          Divider(
            height: 0.1,
          ),
          // ListTile(
          //   title: new Text("Mudar tema"),
          //   leading: new Icon(Icons.settings),
          // ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: new Text("Remover todas tarefas"),
            leading: new Icon(Icons.delete_forever),
            onTap: () {
              // _removerTodasTarefas(context);
            },
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: new Text("Sair"),
            leading: new Icon(Icons.logout_outlined),
            onTap: () {
              // _sair(context);
            },
          ),
        ],
      ),
    );
  }
}
