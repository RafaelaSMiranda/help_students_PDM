// @dart=2.3
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/home/home_page.dart';
import 'package:help_students/providers/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UsuarioControle with ChangeNotifier {
  Usuario _user;
  Usuario get user => _user;
  // NÃO CONSEGUE MODIFICAR A VARÍAVEL EM OUTRO LOCAL DO CODIGO

  void setUser(BuildContext context, Usuario user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => HomePage(user)),
      );
    } else {
      Navigator.of(context).pushNamed('/login');
    }
    notifyListeners();
  }

  Future<void> saveUser(Usuario user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, Usuario.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
    notifyListeners();
  }
}
