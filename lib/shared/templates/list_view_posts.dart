import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/row_profile_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:game_stream/view/home/model/character_model.dart';

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
  List<CharacterModel> addOrRemoveFromFavorites() {
    List<CharacterModel> likedPosts = [];
    for (CharacterModel character in widget.characters) {
      if (character.isFavorite) {
        likedPosts.add(character);
      } else {
        likedPosts.remove(character);
      }
    }
    return likedPosts;
  }

  List<CharacterModel> addOrRemoveFromSavedItems() {
    List<CharacterModel> savedPosts = [];
    for (CharacterModel character in widget.characters) {
      if (character.isSaved) {
        savedPosts.add(character);
      } else {
        savedPosts.remove(character);
      }
    }
    return savedPosts;
  }

  @override
  Widget build(BuildContext context) {
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
                  child: RowProfileInfo(
                    character: widget.characters[index],
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
                    widget.characters[index].isFavorite =
                        !widget.characters[index].isFavorite;
                    ref.read(likedPostsProvider.state).state =
                        addOrRemoveFromFavorites();
                    setState(() {});
                  },
                  icon: Icon(
                    widget.characters[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.characters[index].isFavorite
                        ? Colors.pink
                        : null,
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
                    widget.characters[index].isSaved =
                        !widget.characters[index].isSaved;
                    ref.read(savedPostsProvider.state).state =
                        addOrRemoveFromSavedItems();
                    setState(() {});
                  },
                  icon: Icon(
                    widget.characters[index].isSaved
                        ? Icons.bookmark
                        : Icons.bookmark_border,
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
