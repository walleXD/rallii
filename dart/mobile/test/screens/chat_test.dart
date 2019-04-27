import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';

import 'package:rallii/src/screens/Chat/messageList.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('MessageList', () {
    MaterialApp app;
    final mockObserver = MockNavigatorObserver();

    setUp(() {
      app = MaterialApp(
        home: MessageListScreen(),
        navigatorObservers: [mockObserver],
      );
    });

    testWidgets('renders', (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(app);

        final titleFinder = find.text('Chats');
        expect(titleFinder, findsOneWidget);
      });
    });

    testWidgets('renders conversation list', (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(app);

        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(ListTile), findsWidgets);
      });
    });

    // ToDo: Add navigation testing
    // testWidgets('navigate to message', (WidgetTester tester) async {
    //   await provideMockedNetworkImages(() async {
    //     await tester.pumpWidget(app);

    //     await tester.tap(find.byType(ListTile).first);
    //     await tester.pumpAndSettle();

    //     verify(mockObserver.didPush(typed(any), typed(any)));
    //     // expect(find.byType(MessageScreen), findsOneWidget);
    //   });
    // });
  });
}
