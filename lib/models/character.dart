import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
class CharactersBox extends HiveObject {
  @HiveField(0)
  final charactersInfo = <CharactersInfo>[];
  @HiveField(1)
  final location = <Location>[];
}

@HiveType(typeId: 1)
@JsonSerializable()
class CharactersInfo extends HiveObject {
  CharactersInfo({
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

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String species;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final Location origin;
  @HiveField(7)
  final Location location;
  @HiveField(8)
  final String image;
  @HiveField(9)
  final List<String> episode;
  @HiveField(10)
  final String url;
  @HiveField(11)
  final DateTime created;

  factory CharactersInfo.fromJson(Map<String, dynamic> json) =>
      _$CharactersInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersInfoToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Location extends HiveObject {
  Location({
    required this.name,
    required this.url,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
