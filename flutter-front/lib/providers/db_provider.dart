import 'dart:io';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/task_model.dart';
import 'package:app_uteam/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider() {
    initDB();
  }
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'TasksDB.db');
    print(path);
    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
              CREATE TABLE Tasks (
                id TEXT PRIMARY KEY,
                title TEXT,
                description TEXT
              )
              CREATE TABLE Users (
                id TEXT PRIMARY KEY,
                username TEXT,
                email TEXT
              )
              CREATE TABLE Image (
                id TEXT PRIMARY KEY,
                name TEXT,
                link TEXT
              )
        ''');
    });
  }

  Future<int> nuevaTask(TaskModel nuevaTask) async {
    final db = await database;
    final res = await db!.insert('Tasks', nuevaTask.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(res);
    // Es el ID del último registro insertado;
    return res;
  }

  Future<int> getImages(ImageModel linkImage) async {
    final db = await database;
    final res = await db!.insert('Images', linkImage.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(res);
    // Es el ID del último registro insertado;
    return res;
  }

  Future<int> nuevoUser(UserModel nuevoUser) async {
    final db = await database;
    final res = await db!.insert('Users', nuevoUser.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(res);
    // Es el ID del último registro insertado;
    return res;
  }

  Future<TaskModel?> getTaskById(String id) async {
    final db = await database;
    final response = await db!.query('Tasks', where: 'id = ?', whereArgs: [id]);

    return response.isNotEmpty ? TaskModel.fromJson(response.first) : null;
  }

  Future<UserModel?> getUserById(String id) async {
    final db = await database;
    final response = await db!.query('Users', where: 'id = ?', whereArgs: [id]);

    return response.isNotEmpty ? UserModel.fromJson(response.first) : null;
  }

  Future<List<TaskModel>> getTodasLasTasks() async {
    final db = await database;
    final res = await db!.query('Tasks');

    return res.isNotEmpty ? res.map((t) => TaskModel.fromJson(t)).toList() : [];
  }

  Future<List<UserModel>> getTodosLosUsers() async {
    final db = await database;
    final res = await db!.query('Users');

    return res.isNotEmpty ? res.map((t) => UserModel.fromJson(t)).toList() : [];
  }

  Future<String?> updateTask(TaskModel nuevaTask) async {
    final db = await database;
    final res = await db!.update('Tasks', nuevaTask.toJson(),
        where: 'id = ?', whereArgs: [nuevaTask.id]);
    return res.toString();
  }

  Future<String?> updateUser(UserModel nuevoUser) async {
    final db = await database;
    final res = await db!.update('Users', nuevoUser.toJson(),
        where: 'id = ?', whereArgs: [nuevoUser.id]);
    return res.toString();
  }

  Future<int> deleteTask(String id) async {
    final db = await database;
    final res = await db!.delete('Tasks', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteUser(String id) async {
    final db = await database;
    final res = await db!.delete('Users', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllTasks() async {
    final db = await database;
    final res = await db!.rawDelete('''
      DELETE FROM Tasks    
    ''');
    return res;
  }
}
