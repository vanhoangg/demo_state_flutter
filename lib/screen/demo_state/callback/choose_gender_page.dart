import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/demo_state/callback/demo_callback_page.dart';

class ChooseGenderPage extends StatefulWidget {
  const ChooseGenderPage({super.key, required this.onChangedGender});

  final Function(int value) onChangedGender;

  @override
  _ChooseGenderPageState createState() => _ChooseGenderPageState();
}

class _ChooseGenderPageState extends State<ChooseGenderPage> {
  List<int> gender = [0, 1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gender")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            gender.length,
            (index) => GestureDetector(
                  onTap: () => onChangedGender(gender[index]),
                  child: GenderContainer(gender: gender[index]),
                )),
      ),
    );
  }

  void onChangedGender(int value) {
    widget.onChangedGender(value);
    Navigator.of(context).pop();
  }
}
