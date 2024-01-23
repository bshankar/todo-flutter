import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/widgets/todo_edit.dart';

part 'todo_edit.g.dart';

@swidget
Widget _todoEditScreen(BuildContext context, {int? id}) {
  return Scaffold(
    appBar: AppBar(
      title: Text(id != null ? 'Edit Todo' : 'Create Todo'),
      leading: const BackButton(),
    ),
    body: TodoEdit(id),
  );
}
