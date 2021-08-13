import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class Tarefa with ChangeNotifier {
  final String id;
  final String materia;
  final String descricao;
  final String data;
  bool concluido;

  Tarefa(
      {this.id,
      @required this.materia,
      @required this.descricao,
      @required this.data,
      this.concluido= false});

  void _toggleConcluido() {
    concluido = !concluido;
    notifyListeners();
  }

  Future<void> toggleConcluido() async {
    _toggleConcluido();

    try {
      final url = '${Constants.BASE_API_URL}/products/$id.json';
      final response = await http.patch(
        url,
        body: json.encode({
          'isFavorite': concluido,
        }),
      );

      if (response.statusCode >= 400) {
        _toggleConcluido();
      }
    } catch (error) {
      _toggleConcluido();
    }
  }

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
        id: json['id'],
        materia: json['materia'],
        descricao: json['description'],
        data: json['data'],
        concluido: json['concluido']);
  }

  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
        'id': id,
        'materia': materia,
        'descricao': descricao,
        'data': data,
        'concluido': concluido
      };
}
