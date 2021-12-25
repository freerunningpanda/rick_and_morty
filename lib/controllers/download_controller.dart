import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rick_and_morty/main.dart';

import '../models/character.dart';

class DownloadController extends GetxController {
  late Box<CharactersInfo> charactersBox;

  final dio = Dio();
  var characters = <CharactersInfo>[].obs;
  var isLoad = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacterList();
    charactersBox = Hive.box<CharactersInfo>(charactersList);
  }

  Future<void> fetchCharacterList() async {
    var response = await dio.get('https://rickandmortyapi.com/api/character');
    var results = response.data['results'] as List<dynamic>;
    for (var it in results) {
      characters.add(CharactersInfo.fromJson(it));
    }
    isLoad.value = true;
  }
}
