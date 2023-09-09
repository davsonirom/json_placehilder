import 'package:flutter/material.dart';
import 'package:json_placeholder/model/post_model.dart';
import 'package:json_placeholder/repositories/posrt_repository.dart';

import 'widgets/card_comentario.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final posrtRepository = PosrtRepository();
  List<PostModel> postDoSite = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    pegandoOsPosts();
  }

  pegandoOsPosts() async {
    carregando = true;
    postDoSite = await posrtRepository.obterPosts();
    setState(() {
      carregando = false;
    });
    return postDoSite;
  }

  loading() {
    return const LinearProgressIndicator(
      color: Color(0xffe12885),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbec8d1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Post {Json}Placeholder',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: const Color(0xffe12885),
      ),
      body: carregando ? loading() : CardComentatio(postDoSite: postDoSite),
    );
  }
}
