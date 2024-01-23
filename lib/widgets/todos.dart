import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/providers/db_provider.dart';
import 'package:todo_app/widgets/todo_item.dart';

part 'todos.g.dart';

@cwidget
Widget _todos(BuildContext context, WidgetRef ref) {
  final data = ref.watch(dataProvider);

  return StreamBuilder(
    stream: data.watchTodos(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: snapshot.data!.map<Widget>(TodoItem.new).toList(),
                ),
              ),
            );
          },
        );
      } else if (snapshot.hasError) {
        return const Text('Error');
      } else {
        return const Text('Loading...');
      }
    },
  );
}
