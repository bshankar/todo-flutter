import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'save_button.g.dart';

@swidget
Widget _saveButton(
  BuildContext context, {
  required void Function() onSave,
}) {
  return ElevatedButton.icon(
    icon: const Icon(Icons.save_alt),
    label: const Text('SAVE'),
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      elevation: 2,
    ),
    onPressed: onSave,
  );
}
