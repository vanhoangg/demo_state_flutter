import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/demo_state/demo_stateful_stateless_screen.dart';

import 'screen/demo_bloc/counter_screen.dart';
import 'screen/demo_state/demo_state_screen.dart';
import 'screen/rest_api/demo_api_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(children: [
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DemoStateScreen())),
              child: const CustomText("Demo State Screen")),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const DemoStatefulStatelessScreen())),
              child: const CustomText("Demo Stateless , Stateful")),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterScreen())),
              child: const CustomText("Demo Counter Bloc")),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DemoApiScreen())),
              child: const CustomText("Demo Rest Api Bloc"))
        ])));
  }
}

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        child: Text(text, style: const TextStyle(fontSize: 24)));
  }
}
