import 'package:app_uteam/screens/loading_screen.dart';
import 'package:app_uteam/services/image_services.dart';
import 'package:flutter/material.dart';
import 'package:app_uteam/services/services.dart';
import 'package:provider/provider.dart';

class ListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageServices = Provider.of<ImageServices>(context);
    if (imageServices.isLoading) return LoadingScreen();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Imagenes'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, 'ImageScreen'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            // ignore: sort_child_properties_last
            child: const Icon(Icons.add),
            heroTag: Navigator.pushNamed(context, 'ImageScreen')));
  }
}
