import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../utils/constants.dart';
import './tarefa.dart';

class TarefaControle with ChangeNotifier {
  final String _baseUrl = '${Constants.BASE_API_URL}/tarefas';
  List<Tarefa> _items = [];
  DateTime data = DateTime.now();

  List<Tarefa> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }


  Future<void> concluiTarefa(Tarefa tarefa) async {
    if (tarefa == null || tarefa.id == null) {
      return;
    }
    final index = _items.indexWhere((task) => task.id == tarefa.id);
    if (index >= 0) {
      await http.patch(
        "$_baseUrl/${tarefa.id}.json",
        body: json.encode({
          'materia': tarefa.materia,
          'descricao': tarefa.descricao,
          'data': tarefa.data.toIso8601String(),
          'concluido': !tarefa.concluido,
        }),
      );
      _items[index] = tarefa;
      notifyListeners();
    }
  }

  Future<void> loadtarefas() async {
    final response = await http.get("$_baseUrl.json");
    final date = DateTime.now();
    Map<String, dynamic> data = json.decode(response.body);
    _items.clear();
    if (data != null) {
      data.forEach((tarefaId, tarefaData) {
        _items.add(Tarefa(
          id: tarefaId,
          materia: tarefaData['materia'],
          descricao: tarefaData['descricao'],
          data: DateTime.parse(tarefaData['data']),
          concluido: tarefaData['concluido'],
        ));
      });
      notifyListeners();
    }
  }

  Future<void> addtarefa(Tarefa newtarefa) async {
    final response = await http.post(
      "$_baseUrl.json",
      body: json.encode({
        'materia': newtarefa.materia,
        'descricao': newtarefa.descricao,
        'data': newtarefa.data.toIso8601String(),
        'concluido': newtarefa.concluido,
      }),
    );
    _items.add(Tarefa(
      id: json.decode(response.body)['name'],
      materia: newtarefa.materia,
      descricao: newtarefa.descricao,
      data: newtarefa.data,
    ));
    notifyListeners();
  }

  Future<void> updatetarefa(Tarefa tarefa) async {
    if (tarefa == null || tarefa.id == null) {
      return;
    }

    final index = _items.indexWhere((task) => task.id == tarefa.id);
    if (index >= 0) {
      await http.patch(
        "$_baseUrl/${tarefa.id}.json",
        body: json.encode({
          'materia': tarefa.materia,
          'descricao': tarefa.descricao,
          'data': (tarefa.data).toIso8601String(),
        }),
      );
      _items[index] = tarefa;
      notifyListeners();
    }
  }

  Future<void> deletetarefa(String id) async {
    final index = _items.indexWhere((task) => task.id == id);
    if (index >= 0) {
      final tarefa = _items[index];
      _items.remove(tarefa);
      notifyListeners();
      final response = await http.delete("$_baseUrl/${tarefa.id}.json");
      if (response.statusCode >= 400) {
        _items.insert(index, tarefa);
        notifyListeners();
        throw HttpException('Ocorreu um erro na exclusão da tarefa.');
      }
    }
  }
}
