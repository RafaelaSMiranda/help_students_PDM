import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../providers/tarefa.dart';
import '../../providers/tarefas.dart';

class TarefaForm extends StatefulWidget {
  @override
  _TarefaFormState createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  final _materiaFocusNode = FocusNode();
  final _descricaoFocusNode = FocusNode();
  final _dataFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool _isLoading = false;
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
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _materiaFocusNode.dispose();
    _descricaoFocusNode.dispose();
    _dataFocusNode.dispose();
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
      _isLoading = true;
    });

    final tarefas = Provider.of<Tarefas>(context, listen: false);

    try {
      if (_formData['id'] == null) {
        await tarefas.addtarefa(tarefa);
        print('salvo com sucesso');
      } else {
        await tarefas.updatetarefa(tarefa);
      }
      Navigator.of(context).pop();
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ocorreu um erro!'),
          content: Text('Ocorreu um erro pra salvar a tarefa!'),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Nova tarefa'),
      ),
      body: _isLoading
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
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_materiaFocusNode);
                              },
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
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_descricaoFocusNode);
                            },
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
                        children: [
                          TextFormField(
                            inputFormatters: [maskFormatter],
                            initialValue: _formData['data'],
                            style: TextStyles.input,
                            decoration: InputDecoration(
                              labelText: 'Data',
                              filled: true,
                            ),
                            keyboardType: TextInputType.datetime,
                            focusNode: _dataFocusNode,
                            onSaved: (value) => _formData['data'] = value,
                            validator: (value) {
                              bool isEmpty = value.trim().isEmpty;
                              if (isEmpty) {
                                return 'Informe a data da tarefa!';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            ButtonTheme(
                              height: 70.0,
                              child: RaisedButton(
                                onPressed: () => {_saveForm()},
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                child: Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                color: Colors.green[600],
                              ),
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
