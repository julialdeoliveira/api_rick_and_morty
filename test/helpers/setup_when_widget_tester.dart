import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/usecase/character_provider.dart';
import 'package:game_stream/view/feed/providers/providers.dart';
import 'package:game_stream/view/generate_routes.dart';
import 'package:game_stream/view/home/model/character_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/fake_repository.dart';

class SetupWhenWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWhenWidgetTester({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likedPostsProviderFaker = StateProvider<List<CharacterModel>>(
        (ref) => FakeRepository.getAllLikedPosts());
    final savedPostsProviderFaker = StateProvider<List<CharacterModel>>(
        (ref) => FakeRepository.getAllSavedPosts());
    final characterProviderFaker = FutureProvider<List<CharacterModel>>(
      (ref) async => await FakeRepository.getAllCharacters(),
    );

    return ProviderScope(
        overrides: [
          likedPostsProvider.overrideWithProvider(likedPostsProviderFaker),
          savedPostsProvider.overrideWithProvider(savedPostsProviderFaker),
          charactersProvider.overrideWithProvider(characterProviderFaker)
        ],
        child: MaterialApp(
          onGenerateRoute: GenerateRoute.findRoute,
          home: Material(
            child: MediaQuery(
              data: const MediaQueryData(),
              child: child,
            ),
          ),
        ));
  }
}

Future<void> loadPageWhen(WidgetTester tester, Widget child) async {
  var widget = SetupWhenWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
