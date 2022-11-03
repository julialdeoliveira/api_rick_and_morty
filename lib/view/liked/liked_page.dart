import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/view/feed/providers/providers.dart';
import 'package:game_stream/view/home/model/character_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/list_view_posts.dart';
import '../../shared/templates/replacement_if_list_is_empty.dart';

class LikedPage extends StatefulHookConsumerWidget {
  static const route = "/liked";
  const LikedPage({super.key});

  @override
  ConsumerState<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends ConsumerState<LikedPage> {
  @override
  Widget build(BuildContext context) {
    final likedItems = ref.watch(likedPostsProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Your liked items"),
      ),
      body: Column(
        children: [
          Visibility(
            visible: likedItems.isNotEmpty,
            replacement: const ReplacementIfListIsEmpty(),
            child: Expanded(
              child: ListViewPosts(
                characters: likedItems as List<CharacterModel>,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(index: 0),
    );
  }
}
