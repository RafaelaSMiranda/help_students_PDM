// @dart=2.3
import 'dart:convert';

class Usuario {
  final String name;
  final String photoURL;
  final String id;
  final String email;

  Usuario({this.name, this.photoURL, this.id, this.email});

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
        "id": id,
        "email": email,
      };

  String toJson() => jsonEncode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
        name: map['name'],
        photoURL: map['photoURL'],
        id: map['id'],
        email: map['email']);
  }

  factory Usuario.fromJson(String json) => Usuario.fromMap(jsonDecode(json));
}
