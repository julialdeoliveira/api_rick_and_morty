// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/view/generate_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWidgetTester({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
