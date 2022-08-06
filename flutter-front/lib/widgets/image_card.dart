// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_uteam/models/image_model.dart' as img;
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
          child: Stack(
            children: [
              _BlackgroundImage(),
            ],
          ),
        ));
  }

  BoxDecoration _CardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(
                  0, // horizontal, move right 10
                  7 // vertical, move down 10
                  ),
            )
          ]);
}

class _BlackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          height: 400,
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
            fit: BoxFit.cover,
          ),
        ));
  }
}
