import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rallii/main.dart';

void main() {
  testWidgets('App Root loads', (WidgetTester tester) async {
    final testKey = Key('APP_ROOT');
    await tester.pumpWidget(AppRoot(key: testKey));

    expect(find.byKey(testKey), findsOneWidget);
  });
}
