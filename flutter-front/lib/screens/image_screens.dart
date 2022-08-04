import 'package:app_uteam/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              UteamImage(),
              Positioned(
                top: 60,
                left: 20,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back, size: 40, color: Colors.white),
                ),
              ),
              Positioned(
                top: 60,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    // TO DO CAMERA O GALLERY
                  },
                  icon: Icon(Icons.camera_alt_outlined,
                      size: 40, color: Colors.white),
                ),
              ),
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save_outlined), onPressed: () {}),
    );
  }
}
