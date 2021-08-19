// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/providers/usuario.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  final Usuario _user;
  AppDrawer(this._user);

  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryDrawer,
            ),
            accountName: Text(_user.name),
            accountEmail: Text(_user.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Container(
                  width: 85.0,
                  height: 90.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: new NetworkImage(_user.photoURL)))),
            ),
          ),
          ListTile(
            title: new Text("Remover todas tarefas"),
            leading: new Icon(Icons.delete_forever),
            onTap: () {
              _removerTodasTarefas(context);
            },
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: new Text("Sair"),
            leading: new Icon(Icons.logout_outlined),
            onTap: () {
              _sair(context);
            },
          ),
        ],
      ),
    );
  }
}

_removerTodasTarefas(context) {
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Remover tarefas'),
              content:
                  Text('Você tem certeza que deseja remover todas as tarefas?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Não'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                TextButton(
                  child: Text('Sim'),
                  onPressed: () {
                    Provider.of<TarefaControle>(context, listen: false)
                        .deleteTodasTarefas();
                    Navigator.of(ctx).pop(true);
                    showDialog<Null>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Tarefas removidas!'),
                        content: Text(
                            'Todas as tarefas foram removidas com sucesso.'),
                        backgroundColor: Colors.green[100],
                      ),
                    );
                  },
                ),
              ],
            ));
  }
}

_sair(context) {
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Sair'),
              content: Text('Tem certeza que deseja sair?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Não'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                TextButton(
                  child: Text('Sim'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ));
  }
}
