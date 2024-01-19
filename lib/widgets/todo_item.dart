import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'todo_item.g.dart';

@swidget
Widget _todoItem(BuildContext context, {required String text}) {
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
                  value: false,
                  onChanged: (b) {},
                ),
                Text(text),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
  );
}
