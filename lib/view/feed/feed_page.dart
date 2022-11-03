import 'package:flutter/material.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/view/feed/widgets/app_bar_feed.dart';
import 'package:game_stream/view/feed/widgets/list_view_profiles.dart';
import 'package:game_stream/view/home/model/character_model.dart';

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
      appBar: const AppBarFeed(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListViewProfiles(characters: characters),
            ),
            const Divider(),
            Flexible(
              child:
                  ListViewPosts(characters: characters as List<CharacterModel>),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(index: 1),
    );
  }
}
