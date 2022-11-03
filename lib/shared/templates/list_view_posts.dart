import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/row_profile_info.dart';
import 'package:game_stream/shared/templates/search_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:game_stream/view/home/model/character_model.dart';

import '../../view/feed/providers/providers.dart';

class ListViewPosts extends StatefulHookConsumerWidget {
  ListViewPosts({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<CharacterModel> characters;
  final TextEditingController searchController = TextEditingController();

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
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 1000,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.minimize),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.characters[index].image),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text('Write a message...'),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                SearchTextFormField(
                                  searchController: widget.searchController,
                                  characters: widget.characters,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  itemCount: widget.characters.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      minVerticalPadding: 30,
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            widget.characters[index].image),
                                      ),
                                      title:
                                          Text(widget.characters[index].name),
                                      trailing: const Chip(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        backgroundColor:
                                            Color.fromRGBO(105, 73, 255, 1),
                                        label: Text(
                                          'Send',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
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
