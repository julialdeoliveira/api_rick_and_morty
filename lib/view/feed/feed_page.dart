import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/view/feed/widgets/list_view_profiles.dart';

import 'package:game_stream/view/home/providers/list_characters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/templates/list_view_posts.dart';

class FeedPage extends StatefulHookConsumerWidget {
  static const route = "/feed";
  const FeedPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(listFollowingProvider.state).state;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Feed'),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                icon: const Icon(Icons.search))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: ListViewProfiles(characters: characters),
            ),
            const Divider(),
            Flexible(
              child: ListViewPosts(characters: characters),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(index: 1),
    );
  }
}
