import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/shared/templates/replacement_if_list_is_empty.dart';
import 'package:game_stream/view/feed/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/list_view_posts.dart';

class SavedPage extends StatefulHookConsumerWidget {
  static const route = "/saved";
  const SavedPage({super.key});

  @override
  ConsumerState<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends ConsumerState<SavedPage> {
  @override
  Widget build(BuildContext context) {
    final savedItems = ref.watch(savedPostsProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Your Saved items'),
      ),
      body: Column(
        children: [
          Visibility(
            visible: savedItems.isNotEmpty,
            replacement: const ReplacementIfListIsEmpty(),
            child: Expanded(
              child: ListViewPosts(
                characters: savedItems,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(index: 2),
    );
  }
}
