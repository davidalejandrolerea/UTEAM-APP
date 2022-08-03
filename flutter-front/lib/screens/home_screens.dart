import 'package:app_uteam/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text('App de Uteam'),
      ),
      body: ListView.separated(
          itemBuilder: ((context, i) => ListTile(
                leading: Icon(
                  menuOptions[i].icon,
                  color: Colors.deepPurple,
                ),
                title: Text(menuOptions[i].name),
                onTap: () {
                  Navigator.pushNamed(context, menuOptions[i].route);
                  //Navigator.pushNamed(context, 'listview2');
                },
              )),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: 4),
    );
  }
}
