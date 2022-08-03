import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
const ImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: const BoxDecoration(),
        
      ),
    );
  }
}
