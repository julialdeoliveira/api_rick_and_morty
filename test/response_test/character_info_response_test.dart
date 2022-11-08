import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/models/character/character_info_response.dart';

void main() {
  test('WHEN chracter_info_response .toJson THEN confirm expectations', () {
    CharacterInfoResponse characterInfoResponse =
        CharacterInfoResponse(2, 3, 'next', 'prev');

    debugPrint(characterInfoResponse.toString());
    expect(characterInfoResponse.toJson(),
        {'count': 2, 'pages': 3, 'next': 'next', 'prev': 'prev'});
  });
}
