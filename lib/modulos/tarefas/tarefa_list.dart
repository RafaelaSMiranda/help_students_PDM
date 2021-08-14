import 'package:help_students/modulos/components/appDrawer.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/create_table.widget.dart';
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
          'Próximas tarefas',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _recarregarTarefas(context),
        child: ListView.builder(
          itemCount: tarefasDados.itemsCount,
          itemBuilder: (ctx, i) => Column(
            
            children: <Widget>[
              InserirTarefa(tarefas[i]),
              Divider(),
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

criarTitulo(String listaNomes) {
  return TableRow(
    children: listaNomes.split(',').map((name) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: Text(name,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        padding: EdgeInsets.all(10),
      );
    }).toList(),
  );
}

criarLinha(String listaNomes, context) {
  return TableRow(
    children: listaNomes.split(',').map((name) {
      if (name == "IconYellow") {
        return new Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(child: new Icon(Icons.circle, color: Colors.yellow)));
      } else if (name == "IconGreen") {
        return new Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(child: new Icon(Icons.circle, color: Colors.green)));
      } else if (name == "IconCheck") {
        return new Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
                child: new Icon(
              Icons.check,
              size: 30,
            )));
      } else {
        return new Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: ListTile(
                title: new Text(name, style: TextStyle(fontSize: 12)),
                onTap: () {},
              ),
            ));
      }
    }).toList(),
  );
}

_createTarefa(context) {
  {
    Alert(
        context: context,
        title: "Nova tarefa",
        content: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              InputTextWidget(label: "Matéria", senha: false),
              InputTextWidget(label: "Tarefa", senha: false),
              InputTextWidget(label: "Data", senha: false),
              ButtonWidget(
                  label: "Cadastrar",
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  })
            ],
          ),
        ),
        buttons: []).show();
  }
}

_sair(context) {
  {
    Alert(
        context: context,
        title: "Tem certeza que deseja sair?",
        content: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              ButtonWidget(
                  label: "Sair",
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  })
            ],
          ),
        ),
        buttons: []).show();
  }
}

_removerTodasTarefas(context) {
  {
    Alert(
        context: context,
        title: "Tem certeza que deseja remover todas as tarefas?",
        content: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              ButtonWidget(
                  label: "Remover",
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  })
            ],
          ),
        ),
        buttons: []).show();
  }
}
