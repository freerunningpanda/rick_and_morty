import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/character.dart';

class DownloadController extends GetxController {
  final dio = Dio();
  var characters = <CharactersInfo>[].obs;
  var isLoad = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCharacterList();
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
