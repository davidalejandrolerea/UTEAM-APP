/*import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserListProvider extends ChangeNotifier {
  List<UserModel> id = [];
  List<UserModel> nombre = [];
  List<UserModel> email = [];
   List<UserModel> user = [];
  //set tasks(List<TaskModel> tasks) {}

Future<UserListProvider> nuevaTask(String nombre, String email) async {
    final nuevoUser = UserModel(Nombre: nombre, Email: email);
    //final id = (await DBProvider.db.nuevaTask(nuevaTask));
    // Asignar el ID de la base de datos al modelo
    nuevoUser.id = id.toString();

    this.user.add(nuevoUser);
    notifyListeners();

    return nuevoUser;
  }

  cargarTasks() async {
    final user = await DBProvider.db.getTodasLasTasks();
    this.user = [...user];
    print(user);
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllTasks();
    this.user = [];
    notifyListeners();
  }

  borrarTaskPorId(
    String id,
  ) async {
    await DBProvider.db.deleteTask(id);
    this.cargarUser();
  }
}

}
*/