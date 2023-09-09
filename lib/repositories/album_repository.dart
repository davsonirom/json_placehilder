import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder/model/album_model.dart';

class AlbumRepository {
  Future<List<AlbumModel>> obterAlbuns() async {
    String url = 'https://jsonplaceholder.typicode.com/albums';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonAlbum = jsonDecode(response.body);
      return (jsonAlbum as List)
          .map((e) => AlbumModel.fromJson(jsonEncode(e)))
          .toList();
    } else {
      return [];
    }
  }
}
