import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo.dart';
import 'package:uuid/uuid.dart';

part 'todos.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  List<Todo> build() {
    var uuid = const Uuid();
    return [
      Todo(id: uuid.v4(), title: 'Wash clothes', isDone: false),
      Todo(id: uuid.v4(), title: 'Pay rent', isDone: false),
      Todo(id: uuid.v4(), title: 'Cut my nails', isDone: false),
      Todo(id: uuid.v4(), title: 'Shave my head', isDone: false),
      Todo(id: uuid.v4(), title: 'Buy some candles', isDone: false)
    ];
  }

  void addTodo(String title) {
    var uuid = const Uuid(); // Provider?
    state = [Todo(id: uuid.v4(), title: title, isDone: false), ...state];
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
