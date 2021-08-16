import 'package:firebase_core/firebase_core.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/utils/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    print(_initialization);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possível iniciar o Firebase",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        } else {
          return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
<<<<<<< Updated upstream
          );
        }
      },
    );
=======
            initialRoute: "/splash",
            routes: {
              AppRoutes.SPLASH: (context) => SplashScreen(),
              AppRoutes.LOGIN: (context) => LoginPage(),
              AppRoutes.HOME: (context) => HomePage(),
              AppRoutes.CADASTRO: (context) => CadastroPage(),
              // AppRoutes.CADASTRO_TAREFA: (context) => TarefaForm(),
              AppRoutes.EDICAO: (context) => EditarPerfil(),
              AppRoutes.LISTA_TAREFAS: (context) => ListaTarefas(),
            }));
>>>>>>> Stashed changes
  }
}
