import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/feed/providers/providers.dart';

class ListViewPosts extends StatefulHookConsumerWidget {
  const ListViewPosts({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List characters;

  @override
  ConsumerState<ListViewPosts> createState() => _ListViewPostsState();
}

class _ListViewPostsState extends ConsumerState<ListViewPosts> {
  late List<dynamic> savedPosts;
  void addOrRemoveFromFavorites(int index, int id) {
    if (savedPosts[index].id != id) {
      savedPosts.add(widget.characters[index]);
    }
    savedPosts.remove(widget.characters[index]);
  }

  @override
  Widget build(BuildContext context) {
    final likedPosts = ref.read(likedPostsProvider.state).state;
    savedPosts = ref.read(savedPostsProvider.state).state;
    var isSaved = ref.read(isSavedProvider.state);
    var isFavorite = ref.read(isFavoriteProvider.state);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/profiles",
                        arguments: widget.characters[index]);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage(widget.characters[index].image),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.characters[index].name),
                          Text(widget.characters[index].location["name"]),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                ),
              ),
            ),
            Image.network(
              widget.characters[index].image,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    isFavorite.state = !isFavorite.state;
                    likedPosts.add(widget.characters[index]);
                    setState(() {});
                  },
                  icon: Icon(
                    isFavorite.state ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite.state ? Colors.pink : null,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mode_comment_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send_outlined),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    isSaved.state = !isSaved.state;
                    addOrRemoveFromFavorites(
                        index, widget.characters[index].id);
                    setState(() {});
                  },
                  icon: Icon(
                    isSaved.state ? Icons.bookmark : Icons.bookmark_border,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
