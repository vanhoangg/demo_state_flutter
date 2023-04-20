import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/demo_bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    super.key,
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  double? counter = 0;

  final CounterBloc _bloc = CounterBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo State"),
      ),
      body: BlocProvider<CounterBloc>(
        create: (context) => _bloc,
        child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                    onPressed: () {
                      _bloc.add(TapCounterEvent());
                    },
                    child: const Text("Click me now !"))
              ],
            ),
          );
        }),
      ),
    );
  }
}
