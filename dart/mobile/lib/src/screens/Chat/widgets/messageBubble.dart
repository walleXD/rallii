import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.message, this.time, this.isMe});

  final String message, time;
  final bool isMe;

  Widget _buildMsg(BuildContext context) => Padding(
        padding: EdgeInsets.only(right: 48.0),
        child: Text(
          message,
          style: TextStyle(color: isMe ? Colors.black : Colors.white),
        ),
      );

  Widget _buildTime(BuildContext context) => Positioned(
        bottom: 0.0,
        right: 0.0,
        child: Row(
          children: <Widget>[
            Text(time,
                style: TextStyle(
                  color: isMe ? Colors.black38 : Colors.white,
                  fontSize: 10.0,
                )),
            SizedBox(width: 3.0),
          ],
        ),
      );

  List<Widget> _buildChildren(BuildContext context) {
    final bg = isMe ? Colors.white : Colors.blueAccent;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          );

    return <Widget>[
      Container(
        margin: const EdgeInsets.all(3.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: .5,
                spreadRadius: 1.0,
                color: Colors.black.withOpacity(.12))
          ],
          color: bg,
          borderRadius: radius,
        ),
        child: Stack(
          children: <Widget>[
            _buildMsg(context),
            _buildTime(context),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: align,
      children: _buildChildren(context),
    );
  }
}
