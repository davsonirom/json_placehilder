import 'package:flutter/material.dart';

import '../../../model/post_model.dart';

class CardComentatio extends StatelessWidget {
  const CardComentatio({
    super.key,
    required this.postDoSite,
  });

  final List<PostModel> postDoSite;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postDoSite.length,
      itemBuilder: (context, index) {
        PostModel post = postDoSite[index];

        return Column(
          children: [
            //! post
            Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: const BoxDecoration(
                color: Color(0xffe12885),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
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
                          post.title.toUpperCase(),
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
                        post.body,
                        style: const TextStyle(color: Color(0xFF373b3e)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.comment,
                          color: Color(0xffe12885),
                        ),
                        label: const Text(
                          'Comentários',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffe12885),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
