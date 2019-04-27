import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rallii/src/screens/Chat/messageList.dart';

void main() {
  group('MessageList', () {
    MaterialApp app;

    setUp(() {
      app = MaterialApp(
        home: MessageListScreen(),
      );
    });

    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpWidget(app);

      final titleFinder = find.text('Chats');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('renders conversation list', (WidgetTester tester) async {
      await tester.pumpWidget(app);

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
    });
  });
}
