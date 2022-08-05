import 'dart:convert';
import 'package:app_uteam/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageService extends ChangeNotifier {
  final String _baseUrl = 'flutter-proyecto-daaf9-default-rtdb.firebaseio.com';
  final List<Uteam123> image = [];
  bool isLoading = true;
  ImageService() {
    this.loadImage();
  }

  Future<List<Uteam123>> loadImage() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'image.json');
    final resp = await http.get(url);
    final Map<String, dynamic> imageMap = json.decode(resp.body);

    imageMap.forEach((key, value) {
      final tempImage = Uteam123.fromMap(value);
      tempImage.id = key;
      this.image.add(tempImage);
    });
    this.isLoading = false;
    notifyListeners();
    return this.image;
  }
}
