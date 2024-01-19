import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/providers/todos.dart';
import 'package:todo_app/widgets/todo_item.dart';

part 'todos.g.dart';

@cwidget
Widget _todos(BuildContext context, WidgetRef ref) {
  final todos = ref.watch(todosNotifierProvider);

  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: todos.map(TodoItem.new).toList(),
          ),
        ),
      );
    },
  );
}
