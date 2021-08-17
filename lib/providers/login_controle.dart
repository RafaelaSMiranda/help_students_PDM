// @dart=2.3
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:help_students/providers/usuario.dart';
import 'package:help_students/providers/usuario_controle.dart';

class LoginControle with ChangeNotifier {
  Usuario _user;
  Usuario get user => _user;

  final authController = UsuarioControle();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = Usuario(
          name: response.displayName,
          photoURL: response.photoUrl,
          id: response.id,
          email: response.email);
      _user = user;
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
    notifyListeners();
  }
}
