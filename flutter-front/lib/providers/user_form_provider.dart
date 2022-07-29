import 'package:app_uteam/models/tasks.dart';
import 'package:flutter/material.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Task task;

  TaskFormProvider(this.task);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}