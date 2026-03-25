import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/user_repository.dart';
import '../../model/user_model.dart';

class MyApiPage extends StatefulWidget {
  const MyApiPage({super.key});

  @override
  _MyApiPageState createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPage> {
  List<User> users = [];
  final IUserRepository _repository = UserRepository();

  @override
  void initState() {
    super.initState();
    _repository.fetchUser().then((value) {
      users = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Example")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].email),
            onTap: () {
              print('Tapped on ${users[index].name}');
            },
          );
        },
      ),
    );
  }
}
