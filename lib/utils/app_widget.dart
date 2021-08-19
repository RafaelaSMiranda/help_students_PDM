import 'package:flutter/material.dart';
import 'package:help_students/modulos/Cadastro/cadastroPage.dart';
import 'package:help_students/modulos/home/home_page.dart';
import 'package:help_students/modulos/login/login_page.dart';
import 'package:help_students/modulos/splash/splash_page.dart';
import 'package:help_students/modulos/tarefas/tarefa_form.dart';
import 'package:help_students/modulos/tarefas/tarefa_list.dart';
import 'package:help_students/providers/login_controle.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/providers/usuario.dart';
import 'package:help_students/providers/usuario_controle.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  final Usuario _user = new Usuario();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => new TarefaControle(),
          ),
          ChangeNotifierProvider(
            create: (_) => new UsuarioControle(),
          ),
          ChangeNotifierProvider(
            create: (_) => new LoginControle(),
          ),
        ],
        child: MaterialApp(
            title: 'Help Students',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.green,
              accentColor: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: "/splash",
            routes: {
              AppRoutes.SPLASH: (context) => SplashScreen(),
              AppRoutes.LOGIN: (context) => LoginPage(),
              AppRoutes.HOME: (context) => HomePage(_user),
              AppRoutes.CADASTRO: (context) => CadastroPage(),
              AppRoutes.CADASTRO_TAREFA: (context) => TarefaForm(),
              AppRoutes.LISTA_TAREFAS: (context) => ListaTarefas('todas'),
            }));
  }
}
