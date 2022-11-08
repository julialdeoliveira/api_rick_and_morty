// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterInfoResponse _$CharacterInfoResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterInfoResponse(
      json['count'] as int,
      json['pages'] as int,
      json['next'] as String,
      json['prev'] as String?,
    );

Map<String, dynamic> _$CharacterInfoResponseToJson(
        CharacterInfoResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
