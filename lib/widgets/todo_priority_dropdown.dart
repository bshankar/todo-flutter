import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:todo_app/services/database.dart';

part 'todo_priority_dropdown.g.dart';

@swidget
Widget _todoPriorityDropdown(
  BuildContext context, {
  required TodoPriority priority,
  required void Function(TodoPriority?) onSelected,
}) {
  return DropdownMenu(
    label: const Text('Priority'),
    expandedInsets: EdgeInsets.zero,
    initialSelection: priority,
    onSelected: onSelected,
    dropdownMenuEntries: [
      DropdownMenuEntry(
        value: TodoPriority.low,
        label: 'Low',
        leadingIcon: Icon(
          Icons.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      DropdownMenuEntry(
        value: TodoPriority.medium,
        label: 'Medium',
        leadingIcon: Icon(
          Icons.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      DropdownMenuEntry(
        value: TodoPriority.high,
        label: 'High',
        leadingIcon: Icon(
          Icons.circle,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    ],
  );
}
