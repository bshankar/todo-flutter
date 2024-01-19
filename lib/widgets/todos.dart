import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/widgets/todo_item.dart';

part 'todos.g.dart';

@cwidget
Widget _todos(BuildContext context, WidgetRef ref) {
  const items = 4;

  return LayoutBuilder(builder: (context, constraints) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  items, (index) => TodoItem(text: 'Item $index')),
            )));
  });
}
