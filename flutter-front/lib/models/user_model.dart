import 'dart:convert';
import 'package:meta/meta.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.Nombre,
    this.Email,
  });

  String? id;
  String? Nombre;
  String? Email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        Nombre: json["nombre"],
        Email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": Nombre,
        "email": Email,
      };
}
