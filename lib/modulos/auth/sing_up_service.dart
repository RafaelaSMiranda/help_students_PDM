import 'dart:convert';
import 'package:help_students/modulos/auth/routes.dart';
import 'package:http/http.dart' as http;

class SignUpServices {
  signUp(String email, String password) async {
    print(email);
    print(password);
    http.Response response = await http.post(
      Routes.signUp,
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
  }
}
