import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

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

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

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

  String name;
  String url;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
