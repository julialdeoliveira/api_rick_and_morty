import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/templates/search_text_form_field.dart';
import 'package:game_stream/view/home/home_page.dart';
import 'package:game_stream/view/home/widgets/body_home_page.dart';
import 'package:game_stream/view/home/widgets/bottom_sheet_home.dart';
import 'package:game_stream/view/home/widgets/column_texts.dart';
import 'package:game_stream/view/home/widgets/list_view_search.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/setup_when_widget_tester.dart';
import '../helpers/setup_widget_tester.dart';
import '../shared/fake_repository.dart';

void main() {
  testWidgets('Testing home page', (WidgetTester tester) async {
    await loadPageWhen(tester, HomePage());
    mockNetworkImagesFor(() async {
      await tester.pumpAndSettle();
      expect(find.byType(HomePageBody), findsOneWidget);
    });
  });
  testWidgets('Testing HomePageBody', (WidgetTester tester) async {
    await loadPage(tester,
        HomePageBody(characters: const [], searchController: searchController));
    await tester.pumpAndSettle();
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(ColumnText), findsOneWidget);
    expect(find.byType(Expanded), findsOneWidget);
    expect(find.byType(SearchTextFormField), findsOneWidget);
    expect(find.byType(ListViewSearch), findsOneWidget);
  });

  testWidgets(
      'WHEN calls ListViewSearch THEN find all its widgets AND taps its inkWells',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, ListViewSearch(characters: characters));
      await tester.pumpAndSettle();
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(InkWell), findsWidgets);
      expect(find.byType(ListTile), findsWidgets);
      expect(find.byType(CircleAvatar), findsWidgets);
      expect(find.byType(Chip), findsWidgets);

      await tester.tap(find.text('Follow').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Unfollow').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('name').first);
      await tester.pumpAndSettle();
    });
  });
  testWidgets('WHEN calls BottomSheetHome THEN taps its InkWells',
      (WidgetTester tester) async {
    await loadPage(tester, BottomSheetHome(searchController: searchController));
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
  });
}

TextEditingController searchController = TextEditingController();
