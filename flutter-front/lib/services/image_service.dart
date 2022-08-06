import 'dart:convert';
import 'dart:ui';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/models/task_model.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageService extends ChangeNotifier {
  final String _baseUrl = '2qufsr9dx5.execute-api.us-east-1.amazonaws.com';
  List<Image> users = [];
  late Image selectedImage;
  bool isLoading = true;
  bool isSaving = false;
  late DBProvider _dbProvider;
  ImageService() {
    _dbProvider = DBProvider();
    loadImage();
  }

  Future<List<Image>> loadImage() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, 'images');
    final resp = await http.get(url);
    final Map<String, dynamic> imageMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);
    for (var item in jsonData["images"]) {
      image.add(image(item["link"], item["id"]));
      // _dbProvider.getTodasLasTasks();
      _dbProvider.getImages(ImageModel(id: item["id"], link: item["link"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return image;
  }
}
