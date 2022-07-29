import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final options = const [
    'Aca van los usuarios',
  ];
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Usuarios de Uteam'),
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

      
    );
  }
}