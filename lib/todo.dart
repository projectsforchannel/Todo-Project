import 'dart:convert';

class Todo {
  int id;
  String title;
  String description;
  bool status;

  Todo({this.id, this.title, this.description, this.status}) {
    id = this.id;
    title = this.title;
    description = this.description;
    status = this.status;
  }

  toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "status": status
    };
  }

  fromJson(jsonData) {
    return Todo(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        status: jsonData['status']);
  }
}
