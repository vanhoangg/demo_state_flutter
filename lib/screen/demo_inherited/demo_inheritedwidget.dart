import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: _counter,
      onIncrement: _incrementCounter,
      child: const MaterialApp(
        home: CounterScreen(),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback onIncrement;

  const CounterProvider({
    super.key,
    required this.counter,
    required this.onIncrement,
    required Widget child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return counter != oldWidget.counter;
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Example')),
      body: Center(
        child: Text(
          'Counter: ${counterProvider.counter}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.onIncrement,
        child: const Icon(Icons.add),
      ),
    );
  }
}
