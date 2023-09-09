import 'package:flutter/material.dart';
import 'package:json_placeholder/pages/albuns/album_page.dart';
import 'package:json_placeholder/pages/posts/post_page.dart';

void main() {
  runApp(const MiaSoftware39());
}

class MiaSoftware39 extends StatelessWidget {
  const MiaSoftware39({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '{JSON}Placeholder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffe12885)),
        useMaterial3: true,
      ),
      home: const AlbumPage(),
    );
  }
}
