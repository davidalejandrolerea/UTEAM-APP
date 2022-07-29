import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/task_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:app_uteam/providers/task_form_provider.dart';
import 'package:app_uteam/providers/task_list_provider.dart';
import 'package:app_uteam/services/task_services.dart';
import 'package:app_uteam/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../services/task_services.dart';

class ManageTaskScreen extends StatefulWidget {
  ManageTaskScreen({Key? key}) : super(key: key);

  @override
  State<ManageTaskScreen> createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen> {
  @override
  Widget build(BuildContext context) {
    // DBProvider.db.database;
    // final tempTask = TaskModel(title: 'Sql', description: 'task desde sql');
    // DBProvider.db.nuevaTask(tempTask);
    // print(tempTask);
    // DBProvider.db.getTaskById("brb266rt").then((task) => print(task?.title));

    //DBProvider.db.getTodasLasTasks().then((print));
    //DBProvider.db.deleteAllTasks();
    final tasksService = Provider.of<TaskService>(context);
    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksService.selectedTask),
      child: _ManageTaskScreenBody(tasksService: tasksService),
    );
  }
}

class _ManageTaskScreenBody extends StatefulWidget {
  _ManageTaskScreenBody({
    Key? key,
    required this.tasksService,
  }) : super(key: key);

  TaskService tasksService;
  @override
  State<_ManageTaskScreenBody> createState() => _ManageTaskScreenBodyState();
}

class _ManageTaskScreenBodyState extends State<_ManageTaskScreenBody> {
  @override
  Widget build(BuildContext context) {
    TaskService taskService;
    final taskListProvider = Provider.of<TaskListProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Gestor de Tareas'),
        ),
        body: Material(
          child: Center(
            child: ListView.builder(
              //itemCount: taskListProvider.tasks.length,
              itemCount: widget.tasksService.tasks.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  widget.tasksService.selectedTask =
                      widget.tasksService.tasks[index].copy();
                  Navigator.pushNamed(
                    context,
                    'taskPut',
                  );
                },
                child: TaskCard(
                  task: widget.tasksService.tasks[index],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, 'tasksPost'),
        ));
  }
}
