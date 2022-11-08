import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/view/status/status_page.dart';
import 'package:game_stream/view/status/widgets/container_bottom_sheet.dart';
import 'package:game_stream/view/status/widgets/ink_well_post_status.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/setup_widget_tester.dart';
import 'feed_page_test.dart';

void main() {
  testWidgets(
      'WHEN calls StatusPage THEN ensure it has all the widgets it needs',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, StatusPage(character: character));

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(PostStatusInkWell), findsOneWidget);
      expect(find.byType(ContainerBottomSheetStatus), findsOneWidget);

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();

      await tester.tap(find.byType(PostStatusInkWell));
      await tester.pumpAndSettle();
    });
  });
}
