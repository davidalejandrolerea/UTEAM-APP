import 'dart:convert';

class Images {
  late String nombre;
  late String link;
  late String id;
  Images(
    this.nombre,
    this.link,
    this.id,
  );
  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Images.fromMap(Map<String, dynamic> map) {
    nombre = map['nombre'];
    link = map['link'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "link": link,
        "id": id,
      };

  Images copy() => Images(
        nombre,
        link,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
