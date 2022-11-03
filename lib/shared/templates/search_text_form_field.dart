import 'package:flutter/material.dart';
import 'package:game_stream/view/home/providers/list_characters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/home/model/character_model.dart';

class SearchTextFormField extends StatefulHookConsumerWidget {
  const SearchTextFormField({
    Key? key,
    required this.searchController,
    required this.characters,
  }) : super(key: key);

  final TextEditingController searchController;
  final List<CharacterModel> characters;

  @override
  ConsumerState<SearchTextFormField> createState() =>
      _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends ConsumerState<SearchTextFormField> {
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
    return TextFormField(
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
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 0)),
        filled: true,
        fillColor: Colors.grey.shade300,
      ),
      onChanged: (value) {
        setState(() {
          ref.read(listCharactersProvider.state).state = filterText();
        });
      },
    );
  }
}
