// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResultResponse _$CharacterResultResponseFromJson(
        Map<String, dynamic> json) =>
    CharacterResultResponse(
      json['id'] as int,
      json['name'] as String,
      json['status'] as String,
      json['species'] as String,
      json['type'] as String,
      json['gender'] as String,
      json['origin'] as Map<String, dynamic>,
      json['location'] as Map<String, dynamic>,
      json['image'] as String,
      (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      json['url'] as String,
      json['created'] as String,
    );

Map<String, dynamic> _$CharacterResultResponseToJson(
        CharacterResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };
