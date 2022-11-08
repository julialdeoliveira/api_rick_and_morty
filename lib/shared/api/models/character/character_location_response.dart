import 'package:json_annotation/json_annotation.dart';

part 'character_location_response.g.dart';

@JsonSerializable()
class CharacterLocationResponse {
  final String name;
  final String url;
  CharacterLocationResponse(
    this.name,
    this.url,
  );

  factory CharacterLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterLocationResponseToJson(this);
}
