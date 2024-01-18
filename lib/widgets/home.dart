import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: const Todos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Todos extends ConsumerWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const items = 4;

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    items, (index) => TodoItem(text: 'Item $index')),
              )));
    });
  }
}

class TodoItem extends StatelessWidget {
  final String text;

  const TodoItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          height: 75,
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Row(children: [
                  Checkbox(
                    value: false,
                    onChanged: (b) {},
                  ),
                  Text(text)
                ]),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                )
              ]))),
    );
  }
}
