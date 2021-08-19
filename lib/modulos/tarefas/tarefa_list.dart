import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/modulos/tarefas/tarefa_insert.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//
class ListaTarefas extends StatelessWidget {
  Future<void> _recarregarTarefas(BuildContext context) {
    return Provider.of<TarefaControle>(context, listen: false).loadtarefas();
  }

  final String condicao;

  ListaTarefas(this.condicao);

  void initState(context) {
    _recarregarTarefas(context);
  }

  @override
  Widget build(BuildContext context) {
    final tarefasDados = Provider.of<TarefaControle>(context);
    Provider.of<TarefaControle>(context, listen: false).loadtarefas();
    final tarefas = tarefasDados.items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Tarefas',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _recarregarTarefas(context),
        child: ListView.builder(
          itemCount: tarefasDados.itemsCount,
          itemBuilder: (ctx, i) => Column(
            children: <Widget>[
             
              if (condicao == 'concluidas' && tarefas[i].concluido == true)
                InserirTarefa(tarefas[i]),
              if (condicao == 'abertas' && tarefas[i].concluido == false)
                InserirTarefa(tarefas[i]),
              if (condicao == 'todas') InserirTarefa(tarefas[i]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add_task),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.CADASTRO_TAREFA,
            );
          }),
    );
  }
}