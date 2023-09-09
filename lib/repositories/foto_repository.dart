import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder/model/foto_model.dart';

class FotoRepository {
  Future<List<FotoModel>> obterFotos() async {
    String url = 'https://jsonplaceholder.typicode.com/photos';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonFotos = jsonDecode(response.body);
      return (jsonFotos as List)
          .map((e) => FotoModel.fromJson(jsonEncode(e)))
          .toList();
    } else {
      return [];
    }
  }
}
