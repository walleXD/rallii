import 'package:flutter/foundation.dart';

class Conversation {
  Conversation({
    @required String this.id,
    @required String this.lastMsg,
    @required String this.participantNames,
    @required DateTime this.lastMsgAt,
    @required String this.pacticipantPic,
  });

  Conversation.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        lastMsg = data['lastMsg'],
        lastMsgAt = DateTime.parse(data['lastMsgAt']),
        participantNames = data['participantNames'],
        pacticipantPic = data['pacticipantPic'];

  final String id;
  final String lastMsg;
  final String participantNames;
  final DateTime lastMsgAt;
  final String pacticipantPic;
}
