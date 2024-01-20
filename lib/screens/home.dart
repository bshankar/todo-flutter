import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/widgets/todos.dart';

part 'home.g.dart';

@swidget
Widget _homeScreen(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Todos')),
    body: const Todos(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );
}
