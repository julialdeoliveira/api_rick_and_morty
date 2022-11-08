import 'package:game_stream/shared/api/models/character/character_location_response.dart';
import 'package:game_stream/view/home/model/character_model.dart';

class FakeRepository {
  static getAllLikedPosts() {
    return characters;
  }

  static getAllSavedPosts() {
    return characters;
  }

  static getAllCharacters() {
    return characters;
  }
}

List<CharacterModel> characters = [
  CharacterModel(
    id: 1,
    name: 'name',
    status: 'status',
    species: 'species',
    type: 'type',
    gender: 'gender',
    origin: CharacterLocationResponse('sss', 'sss'),
    location: CharacterLocationResponse('sss', 'sss'),
    image: 'image',
    episode: ['episode'],
    url: 'url',
    created: 'created',
  ),
  CharacterModel(
    id: 1,
    name: 'name',
    status: 'status',
    species: 'species',
    type: 'type',
    gender: 'gender',
    origin: CharacterLocationResponse('sss', 'sss'),
    location: CharacterLocationResponse('sss', 'sss'),
    image: 'image',
    episode: ['episode'],
    url: 'url',
    created: 'created',
  ),
];
