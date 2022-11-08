import 'package:flutter_test/flutter_test.dart';
import 'package:game_stream/shared/api/models/character/character_location_response.dart';

void main() {
  test('WHEN character_location_response .toJson THEN confirm expectations',
      () {
    CharacterLocationResponse characterLocationResponse =
        CharacterLocationResponse('name', 'url');

    expect(characterLocationResponse.toJson(), {'name': 'name', 'url': 'url'});
  });
}
