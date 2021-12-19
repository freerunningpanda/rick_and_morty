// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersInfo _$ResultFromJson(Map<String, dynamic> json) => CharactersInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      status:
          $enumDecode(_$StatusEnumMap, json['status'].toString().toLowerCase()),
      species: $enumDecode(
          _$SpeciesEnumMap, json['species'].toString().toLowerCase()),
      type: json['type'] as String,
      gender:
          $enumDecode(_$GenderEnumMap, json['gender'].toString().toLowerCase()),
      origin: Location.fromJson(json['origin'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$ResultToJson(CharactersInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusEnumMap[instance.status],
      'species': _$SpeciesEnumMap[instance.species],
      'type': instance.type,
      'gender': _$GenderEnumMap[instance.gender],
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created.toIso8601String(),
    };

const _$StatusEnumMap = {
  Status.alive: 'alive',
  Status.unknown: 'unknown',
  Status.dead: 'dead',
};

const _$SpeciesEnumMap = {
  Species.human: 'human',
  Species.alien: 'alien',
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
