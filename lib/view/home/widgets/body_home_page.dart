import 'package:flutter/material.dart';
import 'package:game_stream/view/home/widgets/column_texts.dart';
import 'package:game_stream/view/home/widgets/list_view_search.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:game_stream/view/home/providers/list_characters.dart';

import '../model/character_model.dart';

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
    final filteredList = ref.watch(listCharactersProvider.state).state;

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
                  ref.read(listCharactersProvider.state).state = filterText();
                });
              },
            ),
          ),
          const ColumnText(),
          Expanded(
              child: ListViewSearch(
            characters: filteredList,
          )),
        ],
      ),
    );
  }
}
