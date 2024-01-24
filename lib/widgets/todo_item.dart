import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/providers/db_provider.dart';
import 'package:todo_app/services/database.dart';

part 'todo_item.g.dart';

@cwidget
Widget _todoItem(BuildContext context, WidgetRef ref, Todo todo) {
  return GestureDetector(
    onTap: () {
      context.push(Uri(path: '/edit/${todo.id}').toString());
    },
    child: Card(
      elevation: todo.completed ? 0 : 1,
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
                          .read(dataProvider)
                          .toggleCompleted(todo.toCompanion(false));
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      todo.title,
                      style: todo.completed
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : TextStyle(
                              color: getPriorityColor(
                                context,
                                todo.priority,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(dataProvider).deleteTodo(todo);
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Color getPriorityColor(BuildContext context, TodoPriority priority) {
  if (priority == TodoPriority.high) {
    return Theme.of(context).colorScheme.error;
  }

  if (priority == TodoPriority.medium) {
    return Theme.of(context).colorScheme.secondary;
  }
  return Theme.of(context).colorScheme.primary;
}

double getElevation(TodoPriority priority, {required bool completed}) {
  if (completed) return 0;
  if (priority == TodoPriority.high) return 4;
  if (priority == TodoPriority.medium) return 3;
  return 2;
}
