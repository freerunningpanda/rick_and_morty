import 'package:get/get.dart';

import '../api/rick_and_morty_api.dart';
import '../models/character.dart';

class CharacterInfoController extends GetxController {
  final RickAndMortyCharacter rickAndMortyCharacter;
  final int id;

  late CharactersInfo character;
  var isLoad = false.obs;

  CharacterInfoController(
      {required this.id, required this.rickAndMortyCharacter});

  @override
  void onInit() {
    super.onInit();
    fetchCharacter(id);
  }

  Future<void> fetchCharacter(int id) async {
    try {
      character = await rickAndMortyCharacter.getCharacter(id);
      isLoad.value = true;
    } on RickAndMortException catch (e) {
      Get.snackbar('O_o', e.toString());
    }
  }
}
