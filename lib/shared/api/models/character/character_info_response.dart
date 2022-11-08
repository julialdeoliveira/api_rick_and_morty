import 'package:json_annotation/json_annotation.dart';

part 'character_info_response.g.dart';

@JsonSerializable()
class CharacterInfoResponse {
  final int count;
  final int pages;
  final String next;
  final String? prev;

  CharacterInfoResponse(
    this.count,
    this.pages,
    this.next,
    this.prev,
  );

  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterInfoResponseToJson(this);
}
