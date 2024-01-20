import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo.dart';

part 'todos.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  List<Todo> build() {
    return [
      Todo(
        title: 'Wash clothes',
        description: 'Clothes are very smelly. I need to wash them asap.',
      ),
      Todo(
        title: 'Pay rent',
        description: 'My landlord is about to get angry.',
      ),
      Todo(
        title: 'Cut my nails',
        description: 'Fingers are looking quite bad',
      ),
      Todo(
        title: 'Shave my head',
        description: 'Save money on shampoo',
      ),
      Todo(
        title: 'Buy some candles',
        description: 'Powercuts are coming',
      ),
    ];
  }

  void addTodo(String title, String description, TodoPriority? priority) {
    state = [
      Todo(title: title, description: description, priority: priority),
      ...state,
    ];
  }

  void deleteTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }

  void toggleDone(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void updateTitle({required String id, required String newTitle}) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }
}
