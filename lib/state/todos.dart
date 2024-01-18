import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos.g.dart';
part 'todos.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({required String title, required bool isDone}) = _Todo;
}

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  List<Todo> build() {
    return [
      const Todo(title: 'Wash clothes', isDone: false),
      const Todo(title: 'Pay rent', isDone: false),
      const Todo(title: 'Cut my nails', isDone: false),
      const Todo(title: 'Shave my head', isDone: false),
      const Todo(title: 'Buy some candles', isDone: false)
    ];
  }
}
