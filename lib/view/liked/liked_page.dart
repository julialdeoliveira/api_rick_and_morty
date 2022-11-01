import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/view/feed/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/list_view_posts.dart';

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
          Expanded(
              child: ListViewPosts(
            characters: likedItems,
          ))
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(index: 0),
    );
  }
}
