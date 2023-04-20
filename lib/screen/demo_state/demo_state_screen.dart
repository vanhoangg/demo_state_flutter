import 'package:flutter/material.dart';

class DemoStateScreen extends StatefulWidget {
  const DemoStateScreen({
    super.key,
  });

  @override
  State<DemoStateScreen> createState() => _DemoStateScreenState();
}

class _DemoStateScreenState extends State<DemoStateScreen> {
  double? counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo State"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () => _onClickMeNow(),
                child: const Text("Click me now !"))
          ],
        ),
      ),
    );
  }

  void _onClickMeNow() {
    counter = (counter ?? 0) + 1;

    setState(() {});
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const DemoApiScreen()));
  }
}
