import 'package:help_students/modulos/components/appDrawer.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/create_table.widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/providers/tarefa_controle.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:help_students/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//
class HomePage extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<TarefaControle>(context, listen: false).loadtarefas();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<TarefaControle>(context);
    final products = productsData.items;
    products.forEach((tarefa) => print(tarefa.descricao));
    print(products);
    final size = MediaQuery.of(context).size;
    // PEGAR O TAMANHO DA TELA DO APARELHO
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.logout_outlined),
            onPressed: () {
              _sair(context);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.15,
              width: size.width,
              color: AppColors.primary,
            ),
            SizedBox(height: 80),
            Positioned(
              bottom: size.height * 0.76,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      AppImages.avatar,
                      width: 100,
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 1,
                    color: Colors.grey[500],
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: Text(
                        "Maria Clara",
                        style: TextStyles.name,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Sistemas de Informação",
                        style: TextStyles.curso,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            ListView(),
            ListView.builder(
              itemCount: productsData.itemsCount,
              itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  // ProductItem(products[i]),
                  ListTile(
                    title: Text(products[i].descricao),
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   backgroundColor: Colors.grey[700],
      //   items: [
      //     BottomNavigationBarItem(
      //       backgroundColor: Colors.white,
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //     ),
      //     BottomNavigationBarItem(
      //       backgroundColor: Colors.white,
      //       icon: Icon(Icons.search),
      //       title: Text('Buscar'),
      //     )
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
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
