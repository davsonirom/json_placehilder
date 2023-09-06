import 'dart:convert';

class Comentario {
  int postId;
  int id;
  String name;
  String email;
  String body;
  Comentario({
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

  factory Comentario.fromMap(Map<String, dynamic> map) {
    return Comentario(
      postId: map['postId'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comentario.fromJson(String source) =>
      Comentario.fromMap(json.decode(source) as Map<String, dynamic>);
}
