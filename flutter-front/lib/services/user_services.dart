import 'dart:convert';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/user_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  final String _baseUrl = '2qufsr9dx5.execute-api.us-east-1.amazonaws.com';
  List<User> users = [];
  late User selectedUser;
  bool isLoading = true;
  bool isSaving = false;
  late DBProvider _dbProvider;
  UserService() {
    _dbProvider = DBProvider();
    loadUsers();
  }

  Future<String> updateUser(User user) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'users/${user.id}');
    final resp = await http.put(url, body: user.toJson());
    final decodeData = resp.body;
    final index = users.indexWhere((element) => element.id == user.id);
    users[index] = user;
    _dbProvider.updateUser(
        UserModel(id: user.id, username: user.username, email: user.email));
    notifyListeners();
    return user.id;
  }

  Future<String> deleteUser(User user) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'users/${user.id}');
    final resp = await http.delete(url, body: user.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    _dbProvider.deleteUser(user.id);
    notifyListeners();
    return user.id;
  }

  Future<List<User>> loadUsers() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, 'users');
    final resp = await http.get(url);
    final Map<String, dynamic> usersMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);
    for (var item in jsonData["users"]) {
      users.add(User(item["username"], item["email"], item["id"]));
      // _dbProvider.getTodasLasTasks();
      _dbProvider.nuevoUser(UserModel(
          id: item["id"], username: item["username"], email: item["email"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return users;
  }

  Future<http.Response> saveUsers(String text, String text2) {
    return http.post(
      Uri.parse('https://2qufsr9dx5.execute-api.us-east-1.amazonaws.com/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': text,
        'email': text2,
      }),
    );
  }
}
