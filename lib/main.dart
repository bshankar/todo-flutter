import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/widgets/home.dart';

part 'main.g.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
  ],
);

void main() {
  runApp(const ProviderScope(child: TodoApp()));
}

@swidget
Widget _todoApp(BuildContext context) {
  return MaterialApp.router(
    routerConfig: _router,
    theme: ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepOrange,
      ),
      useMaterial3: true,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.deepOrange,
      ),
      useMaterial3: true,
    ),
  );
}
