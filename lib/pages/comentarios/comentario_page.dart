import 'package:flutter/material.dart';
import 'package:json_placeholder/model/comentario_model.dart';
import 'package:json_placeholder/repositories/comentario_repository.dart';

class ComentarioPage extends StatefulWidget {
  const ComentarioPage({
    Key? key,
    required this.postId,
    required this.titilo,
    required this.post,
  }) : super(key: key);
  final int postId;
  final String titilo;
  final String post;

  @override
  State<ComentarioPage> createState() => _ComentarioPageState();
}

class _ComentarioPageState extends State<ComentarioPage> {
  final comentarioRepository = ComentarioRepository();

  List comentariosDoSite = <ComentarioModel>[];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    pegandoComentarios(widget.postId);
  }

  pegandoComentarios(int postId) async {
    carregando = true;
    comentariosDoSite = await comentarioRepository.obterComentarios(postId);
    setState(() {
      carregando = false;
    });
    return comentariosDoSite;
  }

  loading() {
    return const LinearProgressIndicator(
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbec8d1),
      appBar: AppBar(
        title: const Text('comentários'),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFe12885),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! titilo
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffe12885),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 24, top: 8, right: 8, bottom: 8),
                      child: Text(
                        maxLines: 2,
                        widget.titilo.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffe12885),
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      widget.post,
                      style: const TextStyle(color: Color(0xFF373b3e)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          carregando
              ? loading()
              : Expanded(
                  child: ListView.builder(
                    itemCount: comentariosDoSite.length,
                    itemBuilder: (_, index) {
                      ComentarioModel comentario = comentariosDoSite[index];
                      return Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                comentario.body,
                                style:
                                    const TextStyle(color: Color(0xFF373b3e)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      comentario.name.substring(0, 6),
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      comentario.email,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
