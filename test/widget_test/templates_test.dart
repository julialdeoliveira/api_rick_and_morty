import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/shared/templates/list_view_posts.dart';
import 'package:game_stream/shared/templates/replacement_if_list_is_empty.dart';
import 'package:game_stream/shared/templates/row_profile_info.dart';
import 'package:game_stream/shared/templates/search_text_form_field.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/setup_when_widget_tester.dart';
import '../helpers/setup_widget_tester.dart';
import '../shared/fake_repository.dart';
import 'feed_page_test.dart';
import 'home_page_test.dart';

void main() {
  testWidgets(
      'WHEN switch index of CustomNavigationBar then ensure icon color changed',
      (WidgetTester tester) async {
    await loadPage(tester, const CustomNavigationBar(index: 1));
    await tester.tap(find.text('Liked'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Home'));
  });
  testWidgets('WHEN calls RowProfileInfo THEN ensure to find all this widgets',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, RowProfileInfo(character: character));
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(Spacer), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });
  });

  testWidgets('WHEN calls SearchTextFormField THEN test possibilities',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      SearchTextFormField(
        searchController: searchController,
        characters: characters,
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'name');
    await tester.enterText(find.byType(TextFormField), 'species');
    await tester.enterText(find.byType(TextFormField), '');
  });
  testWidgets(
      'WHEN calls ReplacementIfListIsEmpty THEN ensure to find all its widgets',
      (WidgetTester tester) async {
    await loadPage(tester, const ReplacementIfListIsEmpty());
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets('WHEN calls ListViewPosts THEN ensure to find all its widgets',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWhen(tester, ListViewPosts(characters: characters));
      await tester.pumpAndSettle();
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(InkWell), findsWidgets);
      expect(find.byType(RowProfileInfo), findsWidgets);
      expect(find.byType(Image), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(IconButton), findsWidgets);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(Expanded), findsWidgets);
      expect(find.byType(Spacer), findsWidgets);
      expect(find.byType(Icon), findsWidgets);

      await tester.tap(find.byKey(const Key('Icon_comment')).first);
      await tester.pump();

      await tester.tap(find.byKey(const Key('Icon_bookmark')).first);

      await tester.tap(find.byKey(const Key('Icon_bookmark')).first);

      await tester.tap(find.byKey(const Key('Icon_favorite')).first);

      await tester.tap(find.byKey(const Key('Icon_favorite')).first);

      await tester.tap(find.byIcon(Icons.send_outlined).first);
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Icon), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(SearchTextFormField), findsWidgets);
      expect(find.byType(Expanded), findsWidgets);
      expect(find.byType(Chip), findsWidgets);

      await tester.tap(find.byType(RowProfileInfo).first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('name').first);
      await tester.pumpAndSettle();
    });
  });
}
