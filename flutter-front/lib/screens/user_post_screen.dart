import 'package:app_uteam/models/user_model.dart';
import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPostScreen extends StatefulWidget {
  const UserPostScreen({Key? key}) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late UserModel userModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final taskServiceProvider =
       Provider.of<UserService>(context, listen: false);
    final scanListProvider =
        Provider.of<UserListProvider>(context, listen: false);
    // final taskForm = Provider.of<TaskFormProvider>(context);
    //final task = taskForm.task;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo Usuario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 200,
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _tituloController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'Usuario',
                            labelText: 'Ingrese nombre'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Nombre',
                              labelText: 'Email'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await TaskService().saveTasks(
                  _tituloController.text, _descriptionController.text);
              final taskListProvider =
                  Provider.of<UserListProvider>(context, listen: false);
              taskListProvider.nuevaTask(
                  _tituloController.text, _descriptionController.text);
            }
            taskServiceProvider.loadTasks();
            Navigator.of(context).pop();
            taskServiceProvider.tasks = [];
            taskServiceProvider.loadTasks();
          }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));

