import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rallii/main.dart';
import "package:rallii/src/app.dart";

void main() {
  testWidgets('App Root loads', (WidgetTester tester) async {
    await tester.pumpWidget(AppRoot());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(App), findsOneWidget);
  });
}
