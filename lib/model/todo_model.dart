class TodoModel {
  final String id;
  final String title;
  final String content;
  final bool isComplete;

  TodoModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isComplete,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      content: json['body'] ?? '',
      isComplete: json['isComplete'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'body': content,
      'isComplete': isComplete,
    };
  }
}
