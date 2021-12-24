import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CharactersInfo {
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
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory CharactersInfo.fromJson(Map<String, dynamic> json) =>
      _$CharactersInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersInfoToJson(this);
}

@JsonSerializable()
class Location {
  Location({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
