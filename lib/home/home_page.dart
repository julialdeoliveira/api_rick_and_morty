import 'package:flutter/material.dart';
import 'package:game_stream/home/widgets/body_home_page.dart';
import 'package:game_stream/home/widgets/bottom_sheet_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:game_stream/shared/api/usecase/character_provider.dart';
class HomePage extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var characters = ref.watch(characterProvider);
    return Scaffold(
      body: characters.when(
        data: (data) {
          return HomePageBody(
            searchController: searchController,
            characters: characters.asData!.value,
          );
        },
        error: (error, stackTrace) {
          return Text('Deu erro $error');
        },
        loading: () {
          return const Text('...');
        },
      ),
      bottomSheet: const BottomSheetHome(),
    );
  }
}
