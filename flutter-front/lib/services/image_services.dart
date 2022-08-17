import 'dart:convert';
import 'dart:ui';
import 'package:app_uteam/models/models.dart';
import 'package:app_uteam/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageServices extends ChangeNotifier {
  final String _baseUrl = '2qufsr9dx5.execute-api.us-east-1.amazonaws.com';
  List<Images> image = [];
  late Image selectedImage;
  bool isLoading = true;
  bool isSaving = false;
  late DBProvider _dbProvider;
  ImageServices() {
    _dbProvider = DBProvider();
    loadImage();
  }

  Future<List<Images>> loadImage() async {
    isLoading = true;

    isLoading = false;
    notifyListeners();
    return image;
  }
}
