import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  final options = const [
    'Mariano Pivatto',
    'Analia Soriano',
    'Karen Godoy',
    'Gaston Soriano',
    'Walter Roldan',
  ];
  const TeamScreen({Key? key}) : super(key: key);

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

      /*/ floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.edit),
            onPressed: () {},
          ),
          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),*/
    );
  }
}
