import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder/model/post_model.dart';

class PosrtRepository {
  //! pegar os post no endpot do site /posts
  Future<List<PostModel>> obterPosts() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonDosPosts = jsonDecode(response.body);
      return (jsonDosPosts as List)
          .map((e) => PostModel.fromJson(jsonEncode(e)))
          .toList();
    } else {
      return [];
    }
  }
}
