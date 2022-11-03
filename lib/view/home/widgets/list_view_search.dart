import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/character_model.dart';
import '../providers/list_characters.dart';

class ListViewSearch extends StatefulHookConsumerWidget {
  final List<dynamic> characters;
  const ListViewSearch({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  ConsumerState<ListViewSearch> createState() => _ListViewSearchState();
}

class _ListViewSearchState extends ConsumerState<ListViewSearch> {
  List<CharacterModel> addOnFollowingOrRemoveOnFollowing() {
    List<CharacterModel> following = [];
    for (CharacterModel character in widget.characters) {
      if (character.follow == false) {
        following.add(character);
      } else {
        following.remove(character);
      }
    }
    return following;
  }

  void followOrUnfollow(int id) {
    for (CharacterModel character in widget.characters) {
      if (character.id == id) {
        character.follow = !character.follow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      scrollDirection: Axis.vertical,
      itemCount: widget.characters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/profiles", arguments: widget.characters[index]);
            },
            child: ListTile(
              title: Text(widget.characters[index].name),
              subtitle: Text(widget.characters[index].species),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.characters[index].image),
              ),
              trailing: InkWell(
                onTap: () {
                  followOrUnfollow(widget.characters[index].id);
                  ref.read(listFollowingProvider.state).state =
                      addOnFollowingOrRemoveOnFollowing();
                  setState(() {});
                },
                child: Chip(
                  side: !widget.characters[index].follow
                      ? const BorderSide(
                          color: Color.fromRGBO(105, 73, 255, 1),
                        )
                      : null,
                  label: Text(
                    widget.characters[index].follow ? 'Follow' : 'Unfollow',
                    style: TextStyle(
                        color: widget.characters[index].follow
                            ? Colors.white
                            : const Color.fromRGBO(105, 73, 255, 1)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: widget.characters[index].follow
                      ? const Color.fromRGBO(105, 73, 255, 1)
                      : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
