import 'dart:convert';

class User {
  late String username;
  late String email;
  late String id;
  User(
    this.username,
    this.email,
    this.id,
  );
  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  User.fromMap(Map<String, dynamic> map) {
    username = map['username'];
    email = map['email'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "id": id,
      };

  User copy() => User(
        username,
        email,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
