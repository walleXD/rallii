import 'package:flutter/material.dart';

import 'widgets/messageBubble.dart';

class MessageScreen extends StatelessWidget {
  final id;
  final newConvo;

  MessageScreen({this.id, this.newConvo});

  Widget _buildAppBar() => AppBar(
        title: Text("Walter"),
      );

  Widget _buildChatScreen() => Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageBubble(
              message: 'Hi there, this is a message',
              time: '12:00',
              isMe: false,
            ),
            MessageBubble(
              message: 'Bbubble talk',
              time: '12:01',
              isMe: false,
            ),
            MessageBubble(
              message: 'Nice one, Flutter is awesome',
              time: '12:00',
              isMe: true,
            ),
            MessageBubble(
              message: 'I\'ve told you so dude!',
              time: '12:00',
              isMe: false,
            ),
          ],
        ),
      );

  Widget _buildInput() => Row(
        children: <Widget>[
          Flexible(
            child: new TextField(
              maxLines: null,
              decoration:
                  new InputDecoration.collapsed(hintText: "Start typing ..."),
              // controller: _chatController,
              // onSubmitted: _handleSubmit,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              onPressed: () {},
              icon: new Icon(Icons.send),
            ),
          ),
        ],
      );

  Widget _buildBody() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildChatScreen(),
            _buildInput(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
