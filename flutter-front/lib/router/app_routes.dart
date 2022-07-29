import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/pages/change_pages.dart';
import 'package:app_uteam/screens/user_screens.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'ManageTasks',
        icon: Icons.manage_search_outlined,
        name: 'Gestor de Tareas',
        screen: ManageTaskScreen()),
    MenuOption(
        route: 'team',
        icon: Icons.groups_outlined,
        name: 'Equipo UTEAM',
        screen: const TeamScreen()),
    MenuOption(
        route: 'UserScreen',
        icon: Icons.supervised_user_circle_sharp,
        name: 'Usuarios UTEAM',
        screen: const UserScreen()),
    MenuOption(
        route: 'register',
        icon: Icons.app_registration,
        name: 'Register Screen',
        screen: const RegisterScreen()),
    MenuOption(
        route: 'home',
        icon: Icons.home,
        name: 'Home Screen',
        screen: const HomeScreen()),
    MenuOption(
        route: 'login',
        icon: Icons.login_outlined,
        name: 'Pantalla de login',
        screen: const LoginScreen()),
    MenuOption(
        route: 'tasksPost',
        icon: Icons.list_alt_outlined,
        name: 'Agregar Tareas',
        screen: const TaskPostScreen()),
    MenuOption(
        route: 'taskPut',
        icon: Icons.edit,
        name: 'Editar Tareas',
        screen: const TaskPutScreen()),
    MenuOption(
        route: 'home2',
        icon: Icons.app_registration,
        name: 'Cambiar pantalla',
        screen: const TabsPage()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
