import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/view/home/home_page.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  testWidgets('Testing home page', (WidgetTester tester) async {
    await loadPage(tester, HomePage());
    await tester.pumpAndSettle();
  });
}
