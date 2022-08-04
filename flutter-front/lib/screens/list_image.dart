import 'package:app_uteam/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:app_uteam/router/app_routes.dart';

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
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, 'imageScreen'),
            child: ImageCard(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          //heroTag: Navigator.pushNamed()
        ));
  }
}
