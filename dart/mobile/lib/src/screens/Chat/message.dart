import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MessageScreen extends HookWidget {
  final String id;
  final bool newConvo;

  MessageScreen({String this.id, bool this.newConvo = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Walter",
        ),
      ),
      body: Center(
        child: Text(
          "This is Message",
        ),
      ),
    );
  }
}
