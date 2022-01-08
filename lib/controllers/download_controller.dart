import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../api/rick_and_morty_api.dart';
import '../constants.dart';
import '../models/character.dart';

class DownloadController extends GetxController {
  final RickAndMortyHomePage rickAndMortyHomePage;
  late Box<CharactersBox> charactersBox;

  var characters = <CharactersInfo>[].obs;
  var isLoad = false.obs;

  DownloadController(this.rickAndMortyHomePage);

  @override
  void onInit() {
    super.onInit();
    fetchCharacterList();
    charactersBox = Hive.box<CharactersBox>(charactersList);
    var list = [charactersBox.get(charactersList)];
    // list.add(CharactersBox());
    // CharactersBox().save();
  }

  Future<void> fetchCharacterList() async {
    try {
      isLoad.value = true;
      characters.value = await rickAndMortyHomePage.getCharacters();
    } on RickAndMortException catch (e) {
      Get.snackbar('O_o', e.toString());
    }
  }
}
