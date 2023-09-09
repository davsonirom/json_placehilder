import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder/model/comentario_model.dart';

class ComentarioRepository {
  Future<List<ComentarioModel>> obterComentarios(int id) async {
    String url = 'https://jsonplaceholder.typicode.com/$id/1/comments';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonComentario = jsonDecode(response.body);
      return (jsonComentario as List)
          .map((e) => ComentarioModel.fromJson(jsonEncode(e)))
          .toList();
    } else {
      return [];
    }
  }
}
