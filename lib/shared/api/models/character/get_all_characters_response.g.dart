// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_characters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCharactersResponse _$GetAllCharactersResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllCharactersResponse(
      CharacterInfoResponse.fromJson(json['info'] as Map<String, dynamic>),
      (json['results'] as List<dynamic>)
          .map((e) =>
              CharacterResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCharactersResponseToJson(
        GetAllCharactersResponse instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
