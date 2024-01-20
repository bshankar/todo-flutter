import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'todo_edit.g.dart';

String? textValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

void submitForm() {}

@cwidget
Widget _todoEdit(BuildContext context, WidgetRef ref, String? id) {
  return Form(
    child: Column(
      children: [
        TextFormField(
          initialValue: 'Enter task title',
          validator: textValidator,
        ),
        TextFormField(
          initialValue: 'Enter task description',
          validator: textValidator,
        ),
        const ElevatedButton(
          onPressed: submitForm,
          child: Text('Submit'),
        ),
      ],
    ),
  );
}
