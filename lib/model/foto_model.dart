import 'dart:convert';

class Foto {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Foto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Foto.fromMap(Map<String, dynamic> map) {
    return Foto(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Foto.fromJson(String source) =>
      Foto.fromMap(json.decode(source) as Map<String, dynamic>);
}
