import 'package:game_stream/shared/api/models/character/character_location_response.dart';

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationResponse origin;
  final CharacterLocationResponse location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;
  bool follow = true;
  bool isSaved = false;
  bool isFavorite = false;
  bool isStatusViewd = false;
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}
