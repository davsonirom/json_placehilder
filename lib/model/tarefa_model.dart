import 'dart:convert';

class TarefaModel {
  int userId;
  int id;
  String title;
  bool completed;
  TarefaModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TarefaModel.fromMap(Map<String, dynamic> map) {
    return TarefaModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TarefaModel.fromJson(String source) =>
      TarefaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
