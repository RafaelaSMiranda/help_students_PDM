import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_students/modulos/components/button_widget.dart';
import 'package:help_students/modulos/components/input_text_widget.dart';
import 'package:help_students/modulos/home/home_page.dart';
import 'package:help_students/shared/themes/app_images.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
                top: 75,
                left: 0,
                right: 0,
                child: Center(
                    child: Image.asset(AppImages.avatar,
                        width: 300, height: 300))),
            Positioned(
                bottom: size.height * 0.55,
                left: 50,
                right: 50,
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text("Carregar Imagem")))),
            Positioned(
                bottom: size.height * 0.45,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    InputTextWidget(label: "Curso", onChanged: (value) {})
                  ],
                )),
            Positioned(
                bottom: size.height * 0.35,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    InputTextWidget(label: "Usuario", onChanged: (value) {})
                  ],
                )),
            Positioned(
                bottom: size.height * 0.25,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    InputTextWidget(label: "Senha", onChanged: (value) {})
                  ],
                )),
            Positioned(
                bottom: size.height * 0.15,
                left: 50,
                right: 50,
                child: Column(
                  children: [
                    ButtonWidget(
                        label: "Alterar",
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        })
                  ],
                )),
            Positioned(
              bottom: size.height * 0.10,
              left: 50,
              right: 50,
              child: TextButton(
                  child: Text('< Voltar'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
