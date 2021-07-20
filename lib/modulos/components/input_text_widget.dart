import 'package:flutter/material.dart';
import 'package:help_students/shared/themes/app_colors.dart';
import 'package:help_students/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InputTextWidget({
    Key? key,
    required this.label,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Column(
          children: [
            TextFormField(
              initialValue: initialValue,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
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
