import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todos.dart';

part 'todo_item.g.dart';

@cwidget
Widget _todoItem(BuildContext context, WidgetRef ref, Todo todo) {
  return GestureDetector(
    onTap: () {
      context.push(Uri(path: '/edit/${todo.id}').toString());
    },
    child: Card(
      shadowColor: getPriorityColor(todo.priority),
      elevation: getPriorityElevation(todo.priority),
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
                          .toggleCompleted(todo.id);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
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
    ),
  );
}

Color getPriorityColor(TodoPriority priority) {
  if (priority == TodoPriority.high) {
    return Colors.red;
  }

  if (priority == TodoPriority.medium) {
    return Colors.yellow;
  }
  return Colors.green;
}

double getPriorityElevation(TodoPriority priority) {
  if (priority == TodoPriority.high) {
    return 4;
  }

  if (priority == TodoPriority.medium) {
    return 3;
  }
  return 2;
}
