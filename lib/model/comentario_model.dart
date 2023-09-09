import 'dart:convert';

class ComentarioModel {
  int postId;
  int id;
  String name;
  String email;
  String body;
  ComentarioModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory ComentarioModel.fromMap(Map<String, dynamic> map) {
    return ComentarioModel(
      postId: map['postId'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComentarioModel.fromJson(String source) =>
      ComentarioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
