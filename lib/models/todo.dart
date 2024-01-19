import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo._withId(
      {required String id,
      required String title,
      required bool isDone}) = _Todo;

  factory Todo({required String title, required bool isDone}) {
    return Todo._withId(id: const Uuid().v4(), title: title, isDone: isDone);
  }
}
