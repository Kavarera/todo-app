// ignore_for_file: file_names

class TodoModel {
  final String title;
  final String description;
  TodoModel(this.title, this.description);

  Map<String, dynamic> toJson() {
    return {
      'itemTitle': title,
      'description': description,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(json['itemTitle'], json['description']);
  }
}
