import 'package:flutter/material.dart';
import 'package:json_placeholder/model/album_model.dart';
import 'package:json_placeholder/repositories/album_repository.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final AlbumRepository albumRepository = AlbumRepository();
  List albuns = <AlbumModel>[];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregandoDadosSite();
  }

  carregandoDadosSite() async {
    carregando = true;
    albuns = await albumRepository.obterAlbuns();
    setState(() {
      carregando = false;
    });
    return albuns;
  }

  loading() {
    return const Center(child: CircularProgressIndicator.adaptive());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF137a7f),
      appBar: AppBar(
        title: const Text('Albuns'),
      ),
      body: carregando
          ? loading()
          : ListView.builder(
              itemCount: albuns.length,
              itemBuilder: (_, index) {
                AlbumModel album = albuns[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.music_note),
                  ),
                  title: Text(album.title),
                  contentPadding: const EdgeInsets.all(8),
                );
              },
            ),
    );
  }
}
