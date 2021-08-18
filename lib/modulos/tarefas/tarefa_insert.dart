import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_students/providers/tarefa.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InserirTarefa extends StatelessWidget {
  final Tarefa tarefa;

  InserirTarefa(this.tarefa);
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final status = tarefa.concluido;
    Icon icon = Icon(Icons.check, size: 35);
    if (status == true) {
      icon = Icon(Icons.check, size: 35);
    } else {
      if (tarefa.data.difference(now).inDays > 6) {
        icon = Icon(
          Icons.circle,
          size: 35,
          color: Colors.green,
        );
      } else if (tarefa.data.difference(now).inDays >= 0 &&
          tarefa.data.difference(now).inDays <= 5) {
        icon = Icon(
          Icons.circle,
          size: 35,
          color: Colors.orange,
        );
      } else if (tarefa.data.difference(now).inDays < 0) {
        icon = Icon(
          Icons.circle,
          size: 35,
          color: Colors.red,
        );
      }
    }
    return Dismissible(
        key: ValueKey(tarefa.id),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (_) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Remover tarefa'),
                    content: Text(
                        'Você tem certeza que deseja remover esta tarefa?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                      ),
                    ],
                  ));
        },
        onDismissed: (_) {
          Provider.of<TarefaControle>(context, listen: false)
              .deletetarefa(tarefa.id);
        },
        child: ListTile(
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.CADASTRO_TAREFA, arguments: tarefa);
          },
          leading: Icon(
            Icons.keyboard_arrow_left_sharp,
            color: Colors.red[200],
            size: 40,
          ),
          title: Text("\n" + tarefa.materia + "\n", style: TextStyles.materia),
          subtitle: Text(
            tarefa.descricao +
                "\n" +
                "Data: " +
                DateFormat('dd/MM/yyyy HH:mm').format(tarefa.data),
            style: TextStyles.descricao,
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: icon,
                  color: AppColors.primary,
                  onPressed: () {
                    Provider.of<TarefaControle>(context, listen: false)
                        .concluiTarefa(tarefa);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
