import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final bool senha;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.senha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Column(
          children: [
            TextFormField(
              obscureText: senha,
              style: TextStyles.input,
              decoration: InputDecoration(
                labelText: label,
                filled: true,
              ),
            ),
          ],
        ));
  }
}
