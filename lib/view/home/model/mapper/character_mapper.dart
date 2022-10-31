import 'package:game_stream/view/home/model/character_model.dart';
import 'package:game_stream/shared/api/models/character/get_all_characters_response.dart';

extension CharactersMapper on GetAllCharactersResponse {
  List<CharacterModel> toViewData() {
    return results
        .map((result) => CharacterModel(
            id: result.id,
            name: result.name,
            status: result.status,
            species: result.species,
            type: result.type,
            gender: result.gender,
            origin: result.origin,
            location: result.location,
            image: result.image,
            episode: result.episode,
            url: result.url,
            created: result.created))
        .toList();
  }
}
