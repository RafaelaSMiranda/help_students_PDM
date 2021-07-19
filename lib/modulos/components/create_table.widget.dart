import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

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
        criarLinha("Discreta,Lista 01,22-06-2021,IconYellow"),
        criarLinha("FTC,Lista 01,25-06-2021,IconGreen"),
        criarLinha("Linguagens,Prova,18-06-2021,IconCheck"),
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
        child: Text(
          name,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        padding: EdgeInsets.all(10),
      );
    }).toList(),
  );
}

criarLinha(String listaNomes) {
  return TableRow(
    children: listaNomes.split(',').map((name) {
      if (name == "IconYellow") {
        return new Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Center(child: new Icon(Icons.circle, color: Colors.yellow)));
      } else if (name == "IconGreen") {
        return new Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Center(child: new Icon(Icons.circle, color: Colors.green)));
      } else if (name == "IconCheck") {
        return new Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Center(
                child: new Icon(
              Icons.check,
              size: 30,
            )));
      } else {
        return new Padding(
            padding: EdgeInsets.only(top: 12),
            child: Center(
              child: new Text(name, style: TextStyle(fontSize: 15)),
            ));
      }
    }).toList(),
  );
}
