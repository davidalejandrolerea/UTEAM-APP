import 'dart:convert';

class Task {
  late String title;
  late String description;
  late String id;
  Task(
    this.title,
    this.description,
    this.id,
  );
  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Task.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    description = map['description'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "id": id,
      };

  Task copy() => Task(
        title,
        description,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
