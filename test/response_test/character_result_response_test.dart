import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/models/character/character_location_response.dart';
import 'package:game_stream/shared/api/models/character/character_result_response.dart';

void main() {
  test('WHEN character_result_response .toJson THEN confirm expectations', () {
    CharacterResultResponse characterLocationResponse = CharacterResultResponse(
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
        '');
    expect(
      characterLocationResponse.toJson().toString(),
      '{id: 1, name: , status: , species: , type: , gender: , origin: Instance of \'CharacterLocationResponse\', location: Instance of \'CharacterLocationResponse\', image: , episode: [], url: , created: }',
    );
  });
}
