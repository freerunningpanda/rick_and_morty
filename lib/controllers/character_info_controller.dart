import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/character.dart';

class CharacterInfoController extends GetxController {
  final int id;

  var dio = Dio();
  late CharactersInfo character;
  var isLoad = false.obs;

  CharacterInfoController(this.id);

  @override
  void onInit() {
    super.onInit();
    fetchCharacter();
  }

  Future<void> fetchCharacter() async {
    var response =
        await dio.get('https://rickandmortyapi.com/api/character/$id');
    character = CharactersInfo.fromJson(response.data);
    isLoad.value = true;
  }
}
