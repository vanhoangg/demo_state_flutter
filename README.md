# How to Call API in Flutter

This document explains how to call an API in a Flutter application using the provided files: [user_repository.dart](lib/repository/user_repository.dart), [demo_api_screen.dart](lib/screen/rest_api/demo_api_screen.dart), and [user_model.dart](lib/model/user_model.dart).

## Step 1: Define the User Model

First, define a model class to represent the data structure of the API response. In this case, we have a `User` class in [user_model.dart](lib/model/user_model.dart):

```dart
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // Factory method to convert JSON data into User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
```

## Step 2: Create a User Repository

Next, create a repository to handle the API call. This repository will fetch the user data from the API and convert it into a list of `User` objects. This is done in [user_repository.dart](lib/repository/user_repository.dart):

```dart
import 'dart:convert';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<List<User>> fetchUser();
}

class UserRepository implements IUserRepository {
  @override
  Future<List<User>> fetchUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load users');
    }
  }
}
```

## Step 3: Use the Repository in a Flutter Screen

Finally, use the repository in a Flutter screen to fetch and display the user data. This is done in [demo_api_screen.dart](lib/screen/rest_api/demo_api_screen.dart):

```dart
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
      setState(() {
        users = value;
      });
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
```

In this screen, the `UserRepository` is used to fetch the user data in the `initState` method. The data is then displayed in a `ListView.builder`.

By following these steps, you can call an API in a Flutter application and display the data in a user-friendly manner.
