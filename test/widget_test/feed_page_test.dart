import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/models/character/character_location_response.dart';
import 'package:game_stream/view/feed/widgets/app_bar_feed.dart';
import 'package:game_stream/view/feed/widgets/list_view_profiles.dart';
import 'package:game_stream/view/home/model/character_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN calls AppBarFeed THEN see if has all it needs',
      (WidgetTester tester) async {
    await loadPage(tester, const AppBarFeed());
    await tester.pumpAndSettle();

    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('WHEN calls ListViewProfiles THEN see if has all it needs',
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(
            tester,
            ListViewProfiles(characters: [
              CharacterModel(
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
                  created: 'created')
            ]));
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
      },
    );
  });
}
