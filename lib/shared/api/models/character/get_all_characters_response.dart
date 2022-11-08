import 'package:json_annotation/json_annotation.dart';

import 'package:game_stream/shared/api/models/character/character_info_response.dart';
import 'package:game_stream/shared/api/models/character/character_result_response.dart';

part 'get_all_characters_response.g.dart';

@JsonSerializable()
class GetAllCharactersResponse {
  final CharacterInfoResponse info;
  final List<CharacterResultResponse> results;
  GetAllCharactersResponse(
    this.info,
    this.results,
  );

  factory GetAllCharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCharactersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllCharactersResponseToJson(this);
}
