import 'dart:convert';

class Image {
  Image({
    required this.uteam123,
  });

  Uteam123 uteam123;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        uteam123: Uteam123.fromMap(json["uteam123"]),
      );

  Map<String, dynamic> toMap() => {
        "uteam123": uteam123.toMap(),
      };
}

class Uteam123 {
  Uteam123(
      {required this.name,
      required this.uteamPictura,
      required this.uteamPicture,
      required this.id});

  String name;
  String uteamPictura;
  String uteamPicture;
  String id;

  factory Uteam123.fromJson(String str) => Uteam123.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Uteam123.fromMap(Map<String, dynamic> json) => Uteam123(
        name: json["name"],
        uteamPictura: json["uteam_pictura"],
        uteamPicture: json["uteam_picture"],
        id: '',
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "uteam_pictura": uteamPictura,
        "uteam_picture": uteamPicture,
      };
}
