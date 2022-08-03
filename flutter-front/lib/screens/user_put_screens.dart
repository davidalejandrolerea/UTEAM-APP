import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/services/user_services.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:app_uteam/providers/task_list_provider.dart';

class UserPutScreen extends StatefulWidget {
  const UserPutScreen({Key? key}) : super(key: key);

  @override
  State<UserPutScreen> createState() => _UserPutScreenState();
}

class _UserPutScreenState extends State<UserPutScreen> {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return ChangeNotifierProvider(
      create: (_) => UserFormProvider(userService.selectedUser),
      child: _UserPutScreenBody(userService: userService),
    );
  }
}

class _UserPutScreenBody extends StatefulWidget {
  _UserPutScreenBody({Key? key, required this.userService}) : super(key: key);

  UserService userService;

  @override
  State<_UserPutScreenBody> createState() => _UserPutScreenBodyState();
}

class _UserPutScreenBodyState extends State<_UserPutScreenBody> {
  @override
  Widget build(BuildContext context) {
    final userServiceProvider = Provider.of<UserService>(context);

    final userForm = Provider.of<UserFormProvider>(context);
    final user = userForm.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editar Usuario'),
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
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: userForm.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: user.username,
                        onChanged: (value) => user.username = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El username es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: user.email,
                        onChanged: (value) => user.email = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El email es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.save_outlined),
                    onPressed: () async {
                      if (!userForm.isValidForm()) return;
                      await widget.userService.updateUser(userForm.user);
                      userServiceProvider.users = [];
                      userServiceProvider.loadUsers();
                      Navigator.pushReplacementNamed(context, 'UserScreen');
                    }),
                FloatingActionButton(
                    backgroundColor: Colors.white,
                    heroTag: null,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    onPressed: () async {
                      if (!userForm.isValidForm()) return;
                      await widget.userService.deleteUser(userForm.user);
                      // taskServiceProvider.loadTasks();
                      userServiceProvider.users = [];
                      userServiceProvider.loadUsers();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
