import 'dart:async';

import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/snackBar_widget.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../providers/tarefa.dart';
import '../../providers/tarefa_controle.dart';

class TarefaForm extends StatefulWidget {
  @override
  _TarefaFormState createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  String _materia = "";
  String _descricao = "";
  DateTime _data;
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool _carregando = false;
  bool formEdit = false;
  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final tarefa = ModalRoute.of(context).settings.arguments as Tarefa;
      if (tarefa != null) {
        _formData['id'] = tarefa.id;
        _formData['materia'] = tarefa.materia;
        _formData['descricao'] = tarefa.descricao;
        _formData['data'] = tarefa.data;
        formEdit = true;
      }
    }
  }

  Future<void> _saveForm() async {
    var isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    final tarefa = Tarefa(
      id: _formData['id'],
      materia: _formData['materia'],
      descricao: _formData['descricao'],
      data: _formData['data'],
    );

    setState(() {
      _carregando = true;
    });
    final tarefas = Provider.of<TarefaControle>(context, listen: false);
    _materia = _formData['materia'];
    _descricao = _formData['descricao'];
    _data = _formData['data'];
    try {
      if (_formData['id'] == null) {
        await tarefas.addtarefa(tarefa);
      } else {
        await tarefas.updatetarefa(tarefa);
      }
      Navigator.of(context).pop();
      if (formEdit) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Tarefa atualizada!'),
            content: Text('A tarefa ' +
                _descricao +
                ' do curso ' +
                _materia +
                ' para o dia ' +
                ' foi atualizada com sucesso.'),
            backgroundColor: Colors.green[100],
          ),
        );
      } else {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Tarefa cadastrada!'),
            content: Text('A tarefa ' +
                _descricao +
                ' do curso ' +
                _materia +
                ' para o dia ' +
                ' foi cadastrada com sucesso.'),
            backgroundColor: Colors.green[100],
          ),
        );
      }
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Houve um erro!'),
          content:
              Text('Houve um erro pra salvar a tarefa "' + _materia + '".'),
          backgroundColor: Colors.red[100],
        ),
      );
    } finally {
      setState(() {
        _carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Tarefa'),
      ),
      body: _carregando
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: _formData['materia'],
                              style: TextStyles.input,
                              decoration: InputDecoration(
                                labelText: 'Disciplina',
                                filled: true,
                              ),
                              textInputAction: TextInputAction.next,
                              onSaved: (value) => _formData['materia'] = value,
                              validator: (value) {
                                bool isEmpty = value.trim().isEmpty;
                                if (isEmpty) {
                                  return 'Você precisa informar a disciplina!';
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: _formData['descricao'],
                            style: TextStyles.input,
                            decoration: InputDecoration(
                              labelText: 'Descrição',
                              filled: true,
                            ),
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => _formData['descricao'] = value,
                            validator: (value) {
                              bool isEmpty = value.trim().isEmpty;
                              if (isEmpty) {
                                return 'Você precisa informar a descrição da tarefa!';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        children: <Widget>[
                          DateTimeFormField(
                            initialValue: _formData['data'],
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              labelText: 'Data',
                            ),
                            mode: DateTimeFieldPickerMode.dateAndTime,
                            autovalidateMode: AutovalidateMode.always,
                            onDateSelected: (DateTime value) {
                              _formData['data'] = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 30),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            RaisedButton.icon(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              elevation: 10,
                              icon: Icon(
                                Icons.playlist_add_check,
                                color: Colors.white,
                                size: 35,
                              ),
                              label: Text(
                                'Salvar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              color: Colors.green[600],
                              onPressed: () => {_saveForm()},
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
    );
  }
}
