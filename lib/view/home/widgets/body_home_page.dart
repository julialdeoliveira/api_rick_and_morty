import 'package:flutter/material.dart';
import 'package:game_stream/view/home/providers/list_characters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/character_model.dart';
import '../../profile/profile_page.dart';

class HomePageBody extends StatefulHookConsumerWidget {
  final List<CharacterModel> characters;
  const HomePageBody({
    Key? key,
    required this.characters,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  ConsumerState<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends ConsumerState<HomePageBody> {
  bool follow = true;
  List<CharacterModel> filterText() {
    List<CharacterModel> filteredList = [];
    if (widget.searchController.text == '') {
      return widget.characters;
    } else if (widget.searchController.text.isNotEmpty) {
      for (CharacterModel character in widget.characters) {
        if (character.name
            .toLowerCase()
            .contains(widget.searchController.text.toLowerCase())) {
          filteredList.add(character);
        }
        if (character.species
            .toLowerCase()
            .contains(widget.searchController.text.toLowerCase())) {
          filteredList.add(character);
        }
      }
    }
    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = ref.watch(listCharacters.state).state;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: TextFormField(
              controller: widget.searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: const Icon(
                  Icons.mic,
                  color: Colors.indigo,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0)),
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
              onChanged: (value) {
                setState(() {
                  ref.read(listCharacters.state).state = filterText();
                });
              },
            ),
          ),
          const Text(
            'Select some accounts to follow',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Follow some people  that you  \n may know below',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              scrollDirection: Axis.vertical,
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ProfilePage(character: filteredList[index]);
                        },
                      ));
                    },
                    child: ListTile(
                      title: Text(filteredList[index].name),
                      subtitle: Text(filteredList[index].species),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(filteredList[index].image),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            follow = !follow;
                          });
                        },
                        child: Chip(
                          key: Key([index].toString()),
                          side: !follow
                              ? const BorderSide(
                                  color: Color.fromRGBO(105, 73, 255, 1),
                                )
                              : null,
                          label: Text(
                            follow ? 'Follow' : 'Unfollow',
                            style: TextStyle(
                                color: follow
                                    ? Colors.white
                                    : const Color.fromRGBO(105, 73, 255, 1)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: follow
                              ? const Color.fromRGBO(105, 73, 255, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
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
