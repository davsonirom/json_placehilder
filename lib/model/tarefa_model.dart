import 'dart:convert';

class Tarefa {
  int userId;
  int id;
  String title;
  bool completed;
  Tarefa({
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

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tarefa.fromJson(String source) =>
      Tarefa.fromMap(json.decode(source) as Map<String, dynamic>);
}
