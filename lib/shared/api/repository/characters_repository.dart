import 'package:game_stream/shared/api/character_endpoint.dart';
import 'package:game_stream/shared/api/models/character/get_all_characters_response.dart';

class CharactersRepository {
  final CharacterEndpoint _endpoint;
  CharactersRepository(this._endpoint);

  Future<GetAllCharactersResponse> getAllCharacters() async {
    final response = await _endpoint.getAllCharacters();
    return GetAllCharactersResponse.fromJson(response.data);
  }
}
