import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 50),
          width: double.infinity,
          height: 400,
          decoration: _CardBorders(),
        ));
  }

  BoxDecoration _CardBorders() => BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15.0,
              offset: Offset(
                1.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ]);
}
