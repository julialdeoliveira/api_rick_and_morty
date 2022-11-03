import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:game_stream/view/home/providers/list_characters.dart';
import 'package:game_stream/view/home/widgets/column_texts.dart';
import 'package:game_stream/view/home/widgets/list_view_search.dart';

import '../../../shared/templates/search_text_form_field.dart';
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
  @override
  Widget build(BuildContext context) {
    final filteredList = ref.watch(listCharactersProvider.state).state;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: SearchTextFormField(
              searchController: widget.searchController,
              characters: widget.characters,
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
