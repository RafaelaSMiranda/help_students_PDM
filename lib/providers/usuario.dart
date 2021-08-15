import 'dart:convert';

class Usuario {
  final String name;
  final String photoURL;

  Usuario({this.name, this.photoURL});

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  String toJson() => jsonEncode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(name: map['name'], photoURL: map['photoURL']);
  }

  factory Usuario.fromJson(String json) => Usuario.fromMap(jsonDecode(json));
}
