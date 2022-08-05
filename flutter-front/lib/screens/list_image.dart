import 'package:app_uteam/screens/loading_screen.dart';
import 'package:app_uteam/services/image_service.dart';
import 'package:app_uteam/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:app_uteam/router/app_routes.dart';
import 'package:app_uteam/services/services.dart';
import 'package:provider/provider.dart';

class ListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageService = Provider.of<ImageService>(context);
    if (imageService.isLoading) return LoadingScreen();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Imagenes'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, 'imageScreen'),
          ),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)
                // heroTag: Navigator.pushNamed(context, 'imageScreen')
                ));
  }
}
