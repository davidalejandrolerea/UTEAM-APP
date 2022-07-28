import 'dart:convert';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/task_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskService extends ChangeNotifier {
  final String _baseUrl = '2qufsr9dx5.execute-api.us-east-1.amazonaws.com';
  final List<Task> tasks = [];
  late Task selectedTask;
  bool isLoading = true;
  bool isSaving = false;
  late DBProvider _dbProvider;
  TaskService() {
    _dbProvider = DBProvider();
    loadTasks();
  }

  Future<String> updateTask(Task task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'tasks/${task.id}');
    final resp = await http.put(url, body: task.toJson());
    final decodeData = resp.body;
    final index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;
    _dbProvider.updateTask(TaskModel(
        id: task.id, title: task.title, description: task.description));
    notifyListeners();
    return task.id;
  }

  Future<String> deleteTask(Task task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, 'tasks/${task.id}');
    final resp = await http.delete(url, body: task.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    _dbProvider.deleteTask(task.id);
    notifyListeners();
    return task.id;
  }

  Future<List<Task>> loadTasks() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, 'tasks');
    final resp = await http.get(url);
    final Map<String, dynamic> tasksMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);
    for (var item in jsonData["tasks"]) {
      tasks.add(Task(item["title"], item["description"], item["id"]));
      // _dbProvider.getTodasLasTasks();
      _dbProvider.nuevaTask(TaskModel(
          id: item["id"],
          title: item["title"],
          description: item["description"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return tasks;
  }

  Future<http.Response> saveTasks(String text, String text2) {
    return http.post(
      Uri.parse('https://2qufsr9dx5.execute-api.us-east-1.amazonaws.com/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': text,
        'description': text2,
      }),
    );
  }
}
