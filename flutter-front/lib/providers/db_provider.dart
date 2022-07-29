import 'dart:io';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/task_model.dart';
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

  Future<TaskModel?> getTaskById(String id) async {
    final db = await database;
    final response = await db!.query('Tasks', where: 'id = ?', whereArgs: [id]);

    return response.isNotEmpty ? TaskModel.fromJson(response.first) : null;
  }

  Future<List<TaskModel>> getTodasLasTasks() async {
    final db = await database;
    final res = await db!.query('Tasks');

    return res.isNotEmpty ? res.map((t) => TaskModel.fromJson(t)).toList() : [];
  }

  Future<String?> updateTask(TaskModel nuevaTask) async {
    final db = await database;
    final res = await db!.update('Tasks', nuevaTask.toJson(),
        where: 'id = ?', whereArgs: [nuevaTask.id]);
    return res.toString();
  }

  Future<int> deleteTask(String id) async {
    final db = await database;
    final res = await db!.delete('Tasks', where: 'id = ?', whereArgs: [id]);
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
