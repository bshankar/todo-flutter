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
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter title',
            ),
            initialValue: '',
            validator: textValidator,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter description',
            ),
            minLines: 4,
            maxLines: 8,
            initialValue: '',
            validator: textValidator,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: const DropdownMenu(
              label: Text('Priority'),
              expandedInsets: EdgeInsets.zero,
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
          ElevatedButton.icon(
            icon: const Icon(Icons.save_alt),
            label: const Text('Save'),
            onPressed: submitForm,
          ),
        ],
      ),
    ),
  );
}
