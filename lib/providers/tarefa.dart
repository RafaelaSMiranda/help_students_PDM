// @dart=2.3
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Tarefa with ChangeNotifier {
  final String id;
  final String materia;
  final String descricao;
  final DateTime data;
  bool concluido;

  Tarefa(
      {this.id,
      @required this.materia,
      @required this.descricao,
      @required this.data,
      this.concluido = false});

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
