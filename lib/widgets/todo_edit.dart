import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/services/database.dart';

part 'todo_edit.g.dart';

String? textValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

@hcwidget
Widget _todoEdit(BuildContext context, WidgetRef ref, int? id) {
  final editingTodo = useState(
    const Todo(
      id: 0,
      title: '',
      description: '',
      priority: TodoPriority.low,
      completed: false,
    ),
  );

  return Form(
    child: Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter title',
            ),
            initialValue: editingTodo.value.title,
            validator: textValidator,
            onChanged: (title) {
              editingTodo.value = editingTodo.value.copyWith(title: title);
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter description',
              ),
              minLines: 4,
              maxLines: 8,
              initialValue: editingTodo.value.description,
              validator: textValidator,
              onChanged: (description) {
                editingTodo.value =
                    editingTodo.value.copyWith(description: description);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: DropdownMenu(
              label: const Text('Priority'),
              expandedInsets: EdgeInsets.zero,
              initialSelection: editingTodo.value.priority,
              onSelected: (priority) {
                if (priority != null) {
                  editingTodo.value =
                      editingTodo.value.copyWith(priority: priority);
                }
              },
              dropdownMenuEntries: const [
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
            label: const Text('SAVE'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
              elevation: 2,
            ),
            onPressed: () {
              // final store = ref.read(todosNotifierProvider.notifier);

              // if (id == null) {
              //   store.addTodo(editingTodo.value);
              // } else {
              //   store.updateTodo(editingTodo.value);
              // }
              context.go(Uri(path: '/').toString());
            },
          ),
        ],
      ),
    ),
  );
}
