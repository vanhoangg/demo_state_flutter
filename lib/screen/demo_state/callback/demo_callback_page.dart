import 'package:flutter/material.dart';

import 'choose_gender_page.dart';

class DemoCallBackState extends StatefulWidget {
  const DemoCallBackState({super.key});

  @override
  State<DemoCallBackState> createState() => _DemoCallBackStateState();
}

class _DemoCallBackStateState extends State<DemoCallBackState> {
  int? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo CallBack")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Please select your gender"),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChooseGenderPage(
                          onChangedGender: (int value) {
                            gender = value;
                            setState(() {});
                          },
                        ))),
                child: const Text("Choose")),
            gender == null
                ? const SizedBox()
                : GenderContainer(gender: gender!),
          ],
        ),
      ),
    );
  }
}

class GenderContainer extends StatelessWidget {
  const GenderContainer({super.key, required this.gender});
  final int gender;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: gender == 0 ? Colors.blue : Colors.greenAccent,
            shape: BoxShape.circle,
            border: Border.all(width: 2)),
        child: Text(gender == 0 ? "Man" : "Woman"));
  }
}
