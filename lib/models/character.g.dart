// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String,
      prev: json['prev'],
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int,
      name: json['name'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      species: $enumDecode(_$SpeciesEnumMap, json['species']),
      type: json['type'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      origin: Location.fromJson(json['origin'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
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
  Status.alive: 'Alive',
  Status.unknown: 'unknown',
  Status.dead: 'Dead',
};

const _$SpeciesEnumMap = {
  Species.human: 'Human',
  Species.alien: 'Alien',
};

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
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
