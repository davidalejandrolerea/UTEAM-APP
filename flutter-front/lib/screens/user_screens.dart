import 'package:flutter/material.dart';
import 'package:app_uteam/models/user_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:app_uteam/providers/user_form_provider.dart';
import 'package:app_uteam/providers/user_list_provider.dart';
//import 'package:app_uteam/services/task_services.dart';
import 'package:app_uteam/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  final options = const [
    'Usuario 1',
    'Usuario 2',
    'Usuario 3'
  ];
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Usuarios'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios_outlined,
              color: Colors.deepPurple),
          onTap: () {},
        ),
        separatorBuilder: (_, __) => const Divider(),
        
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, 'UserPostScreen'),
        )
    );
    
  }
}

