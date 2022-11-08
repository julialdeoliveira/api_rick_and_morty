import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/templates/custom_navigation_bar.dart';
import 'package:game_stream/shared/templates/list_view_posts.dart';
import 'package:game_stream/view/saved/saved_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/setup_when_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN calls SavedPage THEN ensure it has all the widgets it needs',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWhen(tester, const SavedPage());
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Visibility), findsOneWidget);
      expect(find.byType(Expanded), findsWidgets);
      expect(find.byType(ListViewPosts), findsOneWidget);
      expect(find.byType(CustomNavigationBar), findsOneWidget);
    });
  });
}
