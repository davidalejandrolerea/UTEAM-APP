import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserListProvider extends ChangeNotifier {
  List<UserModel> id = [];
  List<UserModel> username = [];
  List<UserModel> email = [];
  List<UserModel> users = [];
  //set tasks(List<TaskModel> tasks) {}

  Future<UserModel> nuevoUser(String username, String email) async {
    final nuevoUser = UserModel(username: username, email: email);
    //final id = (await DBProvider.db.nuevaTask(nuevaTask));
    // Asignar el ID de la base de datos al modelo
    nuevoUser.id = id.toString();

    this.users.add(nuevoUser);
    notifyListeners();

    return nuevoUser;
  }

  cargarUsers() async {
    final users = await DBProvider.db.getTodosLosUsers();
    this.users = [...users];
    print(users);
    notifyListeners();
  }

  borrarUserPorId(
    String id,
  ) async {
    await DBProvider.db.deleteUser(id);
    this.cargarUsers();
  }
}
