import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/models/todo.dart';

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
    child: Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              initialValue: 'Enter task title',
              validator: textValidator,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: TextFormField(
              minLines: 4,
              maxLines: 8,
              initialValue: 'Enter task description',
              validator: textValidator,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: const DropdownMenu(
              expandedInsets: EdgeInsets.zero,
              label: Text('Priority'),
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: TodoPriority.low,
                  label: 'Low',
                  leadingIcon: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                ),
                DropdownMenuEntry(
                  value: TodoPriority.medium,
                  label: 'Medium',
                  leadingIcon: Icon(
                    Icons.circle,
                    color: Colors.yellow,
                  ),
                ),
                DropdownMenuEntry(
                  value: TodoPriority.high,
                  label: 'High',
                  leadingIcon: Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const ElevatedButton(
            onPressed: submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    ),
  );
}
