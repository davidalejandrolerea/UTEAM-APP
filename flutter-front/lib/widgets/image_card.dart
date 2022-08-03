import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
const ImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(),
        
      ),
    );
  }
}
