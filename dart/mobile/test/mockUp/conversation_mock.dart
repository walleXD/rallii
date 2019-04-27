import 'dart:async';
import 'dart:convert';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import 'package:rallii/src/models/conversation.dart';

Future<Map<String, dynamic>> mockConvoData({int index = 0}) async {
  const Faker faker = Faker();
  final String createdAt = DateTime.now()
      .subtract(
        Duration(days: index),
      )
      .toIso8601String();

  final response = await http.get(
    'https://randomuser.me/api/',
  );

  final decodedResponse = json.decode(response.body);
  final String imageLink =
      decodedResponse['results'][0]['picture']['thumbnail'];

  return <String, dynamic>{
    'id': Uuid().v4(),
    'lastMsgAt': createdAt,
    'lastMsg': faker.food.restaurant(),
    'participantNames': faker.person.name(),
    'pacticipantPic': imageLink
  };
}

Future<Conversation> mockConvo({int index = 0}) async =>
    Conversation.fromMap(await mockConvoData(index: index));

// Stream<List<Conversation>> mockConvos({int count}) {
//   final List<List<Conversation>> mockSnapshot = <List<Conversation>>[
//     List<Conversation>.generate(count, (int index)  => mockConvo(index: index))
//   ];
//   return Stream<List<Conversation>>.fromIterable(mockSnapshot);
// }
