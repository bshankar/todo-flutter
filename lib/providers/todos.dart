import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo.dart';

part 'todos.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  List<Todo> build() {
    return [
      Todo(title: 'Wash clothes'),
      Todo(title: 'Pay rent'),
      Todo(title: 'Cut my nails'),
      Todo(title: 'Shave my head'),
      Todo(title: 'Buy some candles'),
    ];
  }

  void addTodo(String title) {
    state = [Todo(title: title), ...state];
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
        if (todo.id == id) todo.copyWith(isDone: !todo.isDone) else todo,
    ];
  }

  void updateTitle({required String id, required String newTitle}) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isDone: !todo.isDone) else todo,
    ];
  }
}
