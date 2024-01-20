import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todos.dart';

part 'todo_item.g.dart';

@cwidget
Widget _todoItem(BuildContext context, WidgetRef ref, Todo todo) {
  return Card(
    child: SizedBox(
      height: 75,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: todo.completed,
                  onChanged: (b) {
                    ref
                        .read(todosNotifierProvider.notifier)
                        .toggleDone(todo.id);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    context.go(Uri(path: '/edit/${todo.id}').toString());
                  },
                  child: Text(todo.title),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(todosNotifierProvider.notifier).deleteTodo(todo.id);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
