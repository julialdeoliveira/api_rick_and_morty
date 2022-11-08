import 'package:flutter/material.dart';
import 'package:game_stream/view/home/providers/list_characters.dart';
import 'package:game_stream/view/home/widgets/body_home_page.dart';
import 'package:game_stream/view/home/widgets/bottom_sheet_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:game_stream/shared/api/usecase/character_provider.dart';

class HomePage extends StatefulHookConsumerWidget {
  static const route = "/home";
  final TextEditingController searchController = TextEditingController();
  HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var characters = ref.watch(charactersProvider);
    return Scaffold(
      body: characters.when(
        data: (data) {
          Future.delayed(Duration.zero, () {
            ref.read(listCharactersProvider.state).state = data;
          });
          return HomePageBody(
            searchController: widget.searchController,
            characters: data,
          );
        },
        error: (error, stackTrace) {
          return Text('Deu erro $error');
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomSheet: BottomSheetHome(
        searchController: widget.searchController,
      ),
    );
  }
}
