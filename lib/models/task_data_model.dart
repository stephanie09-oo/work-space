class TaskDataModel {
  String? id;
  String title;
  String description;
  DateTime dateTime;

  TaskDataModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });
  factory TaskDataModel.fromJson(Map<String, dynamic> json) {
    return TaskDataModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      'id': id ?? '',
      'title': title,
      'description': description,
      'dateTime': dateTime.toString(),
    };
  }
}
