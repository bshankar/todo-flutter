import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';

enum TodoPriority {
  high,
  medium,
  low,
}

@freezed
class Todo with _$Todo {
  factory Todo({
    required String title,
    required String description,
    TodoPriority? priority,
  }) {
    return Todo._withId(
      id: const Uuid().v4(),
      title: title,
      description: description,
      completed: false,
      priority: priority ?? TodoPriority.low,
    );
  }

  factory Todo.empty() {
    return Todo(title: '', description: '');
  }

  factory Todo._withId({
    required String id,
    required String title,
    required String description,
    required bool completed,
    required TodoPriority priority,
  }) = _Todo;
}
