import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _isDarkMode = prefs.getBool('darkMode') ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SharedPreferences Example')),
      body: Center(
        child: SwitchListTile(
          title: const Text('Dark Mode'),
          value: _isDarkMode,
          onChanged: (bool value) async {
            setState(() {
              _isDarkMode = value;
            });
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('darkMode', value);
          },
        ),
      ),
    );
  }
}
