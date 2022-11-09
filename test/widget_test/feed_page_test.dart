import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/models/character/character_location_response.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/shared/templates/list_view_posts.dart';
import 'package:game_stream/view/feed/feed_page.dart';
import 'package:game_stream/view/feed/widgets/app_bar_feed.dart';
import 'package:game_stream/view/feed/widgets/list_view_profiles.dart';
import 'package:game_stream/view/home/model/character_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/setup_widget_tester.dart';
import '../shared/fake_repository.dart';

void main() {
  testWidgets('WHEN calls FeedPage THEN ensure it has all its widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const FeedPage());
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBarFeed), findsOneWidget);
    expect(find.byType(SafeArea), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
    expect(find.byType(ListViewProfiles), findsOneWidget);
    expect(find.byType(Flexible), findsOneWidget);
    expect(find.byType(ListViewPosts), findsOneWidget);
    expect(find.byType(CustomNavigationBar), findsOneWidget);
  });
  testWidgets('WHEN calls AppBarFeed THEN see if has all it needs',
      (WidgetTester tester) async {
    await loadPage(tester, const AppBarFeed());
    await tester.pumpAndSettle();

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();
  });

  testWidgets('WHEN calls ListViewProfiles THEN see if has all it needs',
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(
          tester,
          ListViewProfiles(
            characters: characters,
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(InkWell), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Stack), findsWidgets);
        expect(find.byType(Container), findsWidgets);
        expect(find.byType(CircleAvatar), findsWidgets);
        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(Text), findsWidgets);

        await tester.tap(find.byType(InkWell).first);
        await tester.pumpAndSettle();
      },
    );
  });
}

CharacterModel character = CharacterModel(
  id: 1,
  name: 'name',
  status: 'status',
  species: 'species',
  type: 'type',
  gender: 'gender',
  origin: CharacterLocationResponse('sss', 'sss'),
  location: CharacterLocationResponse('sss', 'sss'),
  image: 'image',
  episode: ['episode'],
  url: 'url',
  created: 'created',
);
