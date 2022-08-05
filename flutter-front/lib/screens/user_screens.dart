import 'package:flutter/material.dart';
import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
import 'package:app_uteam/services/user_services.dart';
import 'package:app_uteam/widgets/user_card.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return ChangeNotifierProvider(
      create: (_) => UserFormProvider(userService.selectedUser),
      child: _UserScreenBody(userService: userService),
    );
  }
}

class _UserScreenBody extends StatefulWidget {
  _UserScreenBody({
    Key? key,
    required this.userService,
  }) : super(key: key);

  UserService userService;
  @override
  State<_UserScreenBody> createState() => _UserScreenBodyState();
}

class _UserScreenBodyState extends State<_UserScreenBody> {
  @override
  Widget build(BuildContext context) {
    UserService userService;
    final userListProvider = Provider.of<UserListProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Usuarios'),
        ),
        body: Material(
          child: Center(
            child: ListView.builder(
              //itemCount: taskListProvider.tasks.length,
              itemCount: widget.userService.users.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  widget.userService.selectedUser =
                      widget.userService.users[index].copy();
                  Navigator.pushNamed(
                    context,
                    'userPut',
                  );
                },
                child: UserCard(
                  user: widget.userService.users[index],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, 'usersPost'),
        ));
  }
}
