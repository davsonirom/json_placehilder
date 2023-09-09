import 'dart:convert';

class FotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  FotoModel({
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

  factory FotoModel.fromMap(Map<String, dynamic> map) {
    return FotoModel(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FotoModel.fromJson(String source) =>
      FotoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
