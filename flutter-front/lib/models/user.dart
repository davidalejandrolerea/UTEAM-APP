import 'dart:convert';

class User {
  late String Nombre;
  late String Email;
  late String id;
  User(
    this.Nombre,
    this.Email,
    this.id,
  );
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  User.fromMap(Map<String, dynamic> map) {
    Nombre = map['Nombre'];
    Email = map['Email'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "Nombre": Nombre,
        "Email": Email,
        "id": id,
      };

  User copy() => User(
        Nombre,
        Email,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
