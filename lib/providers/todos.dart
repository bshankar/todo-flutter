import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo.dart';

part 'todos.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  List<Todo> build() {
    return [
      Todo(title: 'Wash clothes', isDone: false),
      Todo(title: 'Pay rent', isDone: false),
      Todo(title: 'Cut my nails', isDone: false),
      Todo(title: 'Shave my head', isDone: false),
      Todo(title: 'Buy some candles', isDone: false)
    ];
  }

  void addTodo(String title) {
    state = [Todo(title: title, isDone: false), ...state];
  }

  void deleteTodo(String title) {
    state = [
      for (final todo in state)
        if (todo.title != title) todo,
    ];
  }

  void toggleDone(String title) {
    state = [
      for (final todo in state)
        if (todo.title == title) todo.copyWith(isDone: !todo.isDone) else todo,
    ];
  }

  void updateTitle(String newTitle) {}
}
