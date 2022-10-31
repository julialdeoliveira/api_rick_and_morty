import 'package:game_stream/view/home/model/mapper/character_mapper.dart';
import 'package:game_stream/view/home/model/character_model.dart';
import 'package:game_stream/shared/api/repository/characters_repository.dart';

class CharacterUsecase {
  final CharactersRepository _repository;
  CharacterUsecase(this._repository);

  Future<List<CharacterModel>> execute() async {
    final response = await _repository.getAllCharacters();
    return response.toViewData();
  }
}
