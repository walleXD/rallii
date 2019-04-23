import 'package:flutter_test/flutter_test.dart';

import 'package:rallii/src/screens/Profile/settings.dart';

void main() {
  group('', () {
    testWidgets('', (WidgetTester tester) async {
      await tester.pumpWidget(SettingsScreen());

      expect(find.text("Settings"), findsOneWidget);
    });
  });
}
