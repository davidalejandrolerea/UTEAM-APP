import 'dart:convert';
import 'package:meta/meta.dart';

ImageModel imageModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));
String imagerModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    this.id,
    this.link,
  });

  String? id;
  String? link;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
      };
}
