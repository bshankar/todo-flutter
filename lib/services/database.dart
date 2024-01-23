import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

enum TodoPriority { low, medium, high }

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get description => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  IntColumn get priority =>
      intEnum<TodoPriority>().withDefault(Constant(TodoPriority.low.index))();
}

@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertTodo(Todo todo) => into(todos).insert(todo);
  Future<int> insertCompanionTodo(TodosCompanion todo) =>
      into(todos).insert(todo);
  Future<List<Todo>> getTodos() => select(todos).get();
  Stream<List<Todo>> watchTodos() => select(todos).watch();
  Future<Todo> getTodoById(int id) =>
      (select(todos)..where((u) => u.id.equals(id))).getSingle();

  Future<void> updateTodo(Todo todo) => update(todos).replace(todo);
  Future<void> toggleCompleted(Todo todo) =>
      updateTodo(todo.copyWith(completed: !todo.completed));
  Future<void> deleteTodo(Todo todo) => delete(todos).delete(todo);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
