import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/widgets/todo_edit.dart';

part 'todo_edit.g.dart';

@swidget
Widget _todoEditScreen(BuildContext context, {String? id}) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Edit Todo'),
      leading: BackButton(
        onPressed: () {
          GoRouter.of(context).push('/');
        },
      ),
    ),
    body: TodoEdit(id),
  );
}
