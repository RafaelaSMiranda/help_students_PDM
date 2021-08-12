import 'package:flutter/material.dart';
import 'package:help_students/widgets/button_widget.dart';
import 'package:help_students/widgets/input_text_widget.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Table(
      defaultColumnWidth: FixedColumnWidth(size.width / 4),
      border: TableBorder(
        horizontalInside: BorderSide(
          color: AppColors.grey,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: AppColors.grey,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        criarTitulo("Matéria,Tarefa,Data,Alerta"),
        criarLinha("Discreta,Lista 01,22-06-2021,IconYellow", context),
        criarLinha("FTC,Lista 01,25-06-2021,IconGreen", context),
        criarLinha("Linguagens,Prova,18-06-2021,IconCheck", context),
      ],
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
                onTap: () {
                  _atualizarTarefa(context);
                },
              ),
            ));
      }
    }).toList(),
  );
}

_atualizarTarefa(context) {
  {
    Alert(
        context: context,
        title: "Atualizar tarefa",
        content: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              InputTextWidget(
                  label: "Matéria", onChanged: (value) {}, senha: false),
              InputTextWidget(
                  label: "Tarefa", onChanged: (value) {}, senha: false),
              InputTextWidget(
                  label: "Data", onChanged: (value) {}, senha: false),
              ButtonWidget(
                  label: "Atualizar",
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }),
              ListTile(
                title: new Text("Remover tarefa"),
                leading: new Icon(
                  Icons.delete,
                  size: 30,
                ),
                onTap: () {
                  _removerTarefa(context);
                },
              ),
            ],
          ),
        ),
        buttons: []).show();
  }
}

_removerTarefa(context) {
  {
    Alert(
        context: context,
        title: "Tem certeza que deseja remover esta tarefa?",
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
