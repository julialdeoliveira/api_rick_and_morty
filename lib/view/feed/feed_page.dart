import 'package:flutter/material.dart';
import 'package:game_stream/view/feed/widgets/list_view_profiles.dart';

import 'package:game_stream/view/home/model/character_model.dart';

class FeedPage extends StatelessWidget {
  final List<CharacterModel> characters;
  const FeedPage({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: ListViewProfiles(characters: characters),
            ),
            const Divider(),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    NetworkImage(characters[index].image),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(characters[index].name),
                                  Text(characters[index].location["name"]),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.more_vert),
                            ],
                          ),
                        ),
                      ),
                      Image.network(
                        characters[index].image,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_outline),
                            Icon(Icons.mode_comment_outlined),
                            Icon(Icons.send_outlined),
                            Spacer(),
                            Icon(Icons.bookmark_outline),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
