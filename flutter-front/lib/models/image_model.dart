import 'dart:convert';
import 'package:meta/meta.dart';

ImageModel imageModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));
String imagerModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({this.id, this.nombre, this.link});

  String? id;
  String? nombre;
  String? link;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(id: json["id"], nombre: json["nombre"], link: json["link"]);

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre, "link": link};
}
