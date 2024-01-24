import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/providers/db_provider.dart';
import 'package:todo_app/services/database.dart';
import 'package:todo_app/widgets/loading.dart';
import 'package:todo_app/widgets/save_button.dart';
import 'package:todo_app/widgets/todo_priority_dropdown.dart';

part 'todo_edit.g.dart';

String? textValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

@cwidget
Widget _todoEdit(BuildContext context, WidgetRef ref, int? id) {
  const emptyTodo = TodosCompanion(
    title: Value(''),
    description: Value(''),
    priority: Value(TodoPriority.low),
  );

  if (id == null) {
    return const _TodoEditInner(todo: emptyTodo);
  } else {
    final db = ref.watch(dataProvider);
    return FutureBuilder(
      future: db.getTodoById(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _TodoEditInner(todo: snapshot.data!.toCompanion(false));
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}

@cwidget
Widget __todoEditInner(
  BuildContext context,
  WidgetRef ref, {
  required TodosCompanion todo,
}) {
  var todoUpdates = todo;

  return Form(
    child: Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            initialValue: todo.title.value,
            validator: textValidator,
            onChanged: (title) {
              todoUpdates = todoUpdates.copyWith(title: Value(title));
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              minLines: 4,
              maxLines: 8,
              initialValue: todo.description.value,
              validator: textValidator,
              onChanged: (description) {
                todoUpdates =
                    todoUpdates.copyWith(description: Value(description));
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TodoPriorityDropdown(
              priority: todoUpdates.priority.value,
              onSelected: (priority) {
                todoUpdates = todoUpdates.copyWith(priority: Value(priority!));
              },
            ),
          ),
          SaveButton(
            onSave: () {
              if (todoUpdates.id == const Value<int>.absent()) {
                ref.read(dataProvider).insertTodo(todoUpdates);
              } else {
                ref.read(dataProvider).updateTodo(todoUpdates);
              }
              context.go(Uri(path: '/').toString());
            },
          ),
        ],
      ),
    ),
  );
}
