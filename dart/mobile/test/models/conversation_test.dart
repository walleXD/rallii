import 'package:flutter_test/flutter_test.dart';

import 'package:rallii/src/models/conversation.dart';
import '../mockUp/conversation_mock.dart';

main() {
  group('Conversation', () {
    test('fromMap', () async {
      final Map<String, dynamic> data = await mockConvoData();
      final Conversation convo = Conversation.fromMap(data);

      expect(convo.id, data['id']);
      expect(convo.lastMsg, data['lastMsg']);
      expect(convo.participantNames, data['participantNames']);
      expect(convo.lastMsgAt, DateTime.parse(data['lastMsgAt']));
      expect(convo.pacticipantPic, data['pacticipantPic']);
    });
  });
}
