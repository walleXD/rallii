import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rallii/src/screens/Chat/messageList.dart';

void main() {
  group('MessageList', () {
    final MaterialApp app = MaterialApp(
      home: MessageListScreen(),
    );

    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpWidget(app);

      final titleFinder = find.text('Chats');
      final bodyFinder = find.text('This is Message List');

      expect(titleFinder, findsOneWidget);
      expect(bodyFinder, findsOneWidget);
    });
  });
}
