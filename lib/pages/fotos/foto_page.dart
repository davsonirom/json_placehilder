import 'package:flutter/material.dart';
import 'package:json_placeholder/model/foto_model.dart';
import 'dart:math' as math;

import 'package:json_placeholder/repositories/foto_repository.dart';

class FotoPage extends StatefulWidget {
  const FotoPage({super.key});

  @override
  State<FotoPage> createState() => _FotoPageState();
}

class _FotoPageState extends State<FotoPage> {
  final FotoRepository fotoRepository = FotoRepository();
  List fotos = <FotoModel>[];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    carregandoDadosSite();
  }

  carregandoDadosSite() async {
    fotos = await fotoRepository.obterFotos();
    setState(() {});
    return fotos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos'),
      ),
      body: CustomScrollView(slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (_, index) {
              FotoModel foto = fotos[index];
              return Image.network(foto.thumbnailUrl.toString());
            },
            childCount: fotos.length,
          ),
        ),
      ]),
    );
  }
}
