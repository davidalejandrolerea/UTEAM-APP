import 'package:flutter/material.dart';
import '../widgets/image_card.dart';

class ListImage extends StatelessWidget {
  const ListImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              Text('Item: $index')),
    );
  }
}
