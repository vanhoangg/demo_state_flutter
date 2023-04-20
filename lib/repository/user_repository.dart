import '../model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<List<User>> fetchUser();
}

class UserRepository implements IUserRepository {
  @override
  Future<List<User>> fetchUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    // if (response.statusCode == 200) {
    //   return userFromJson(response.body);
    // } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
    // }
  }
}
