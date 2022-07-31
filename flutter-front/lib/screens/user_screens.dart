import 'package:flutter/material.dart';

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

      
    );
  }
}