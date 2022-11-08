import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/models/character/character_info_response.dart';
import 'package:game_stream/shared/api/models/character/character_location_response.dart';
import 'package:game_stream/shared/api/models/character/character_result_response.dart';
import 'package:game_stream/shared/api/models/character/get_all_characters_response.dart';

void main() {
  test('WHEN character_result_response .toJson THEN confirm expectations', () {
    GetAllCharactersResponse getAllCharactersResponse =
        GetAllCharactersResponse(
      CharacterInfoResponse(1, 1, '', ''),
      [
        CharacterResultResponse(
            1,
            '',
            '',
            '',
            '',
            '',
            CharacterLocationResponse('', ''),
            CharacterLocationResponse('', ''),
            '',
            [],
            '',
            ''),
      ],
    );

    expect(getAllCharactersResponse.toJson().toString(),
        '{info: Instance of \'CharacterInfoResponse\', results: [Instance of \'CharacterResultResponse\']}');
  });
}
