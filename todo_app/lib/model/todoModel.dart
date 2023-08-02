class TodoModel {
  final String Title;
  final String Description;
  TodoModel(this.Title, this.Description);

  Map<String, dynamic> toJson() {
    return {
      'itemTitle': this.Title,
      'description': this.Description,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(json['itemTitle'], json['description']);
  }
}
