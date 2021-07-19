import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

class CriarTableWidget extends StatelessWidget {
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
        criarLinha(
          "Linguagens,Lista 01,18-06-2021,Icon",
        ),
        criarLinha("Discreta,Lista 01,18-06-2021,Icon"),
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
      if (name == "Icon") {
        return new ListTile(
          trailing: new Icon(Icons.circle),
        );
      } else {
        return new ListTile(
          title: new Text(name, style: TextStyle(fontSize: 12)),
        );
      }
    }).toList(),
  );
}
