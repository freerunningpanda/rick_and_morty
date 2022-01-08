import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character.dart';

import 'rick_and_morty_exception.dart';

abstract class RickAndMortyHomePage {
  Future<List<CharactersInfo>> getCharacters();
}

abstract class RickAndMortyCharacter {
  Future<CharactersInfo> getCharacter(int id);
}

class RickAndMortyProvider
    implements RickAndMortyHomePage, RickAndMortyCharacter {
  var dio = Dio();

  @override
  Future<CharactersInfo> getCharacter(int id) async {
    try {
      var response =
          await dio.get('https://rickandmortyapi.com/api/character/$id');
      if (response.statusCode == 200) {
        return CharactersInfo.fromJson(response.data);
      }
      throw RickAndMortException('no 200 statusCode: ${response.statusCode}');
    } on DioError catch (e) {
      throw RickAndMortException(e.message);
    }
  }

  @override
  Future<List<CharactersInfo>> getCharacters() async {
    try {
      var response = await dio.get('https://rickandmortyapi.com/api/character');
      if (response.statusCode == 200) {
        return (response.data['results'] as List<dynamic>)
            .map((e) => CharactersInfo.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      throw RickAndMortException('no 200 statusCode: ${response.statusCode}');
    } on DioError catch (e) {
      throw RickAndMortException(e.message);
    }
  }
}
