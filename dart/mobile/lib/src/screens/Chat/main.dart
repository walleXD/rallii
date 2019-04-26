import 'package:flutter/material.dart';
import 'package:flutter_router/flutter_router.dart';

import 'messageList.dart';
import 'contactList.dart';
import 'contact.dart';
import 'message.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: Router({
        '/contact/new': (context, match) => ContactScreen(
              newContact: true,
            ),
        '/contact/:id': (context, match) => ContactScreen(
              id: match.parameters['id'],
            ),
        '/contact': (context, match) => ContactListScreen(),
        '/new': (context, match) => MessageScreen(
              newMsg: true,
            ),
        '/:id': (context, match) => MessageScreen(
              id: match.parameters['id'],
            ),
        '/': (context, match) => MessageListScreen(),
      }).get,
    );
  }
}
