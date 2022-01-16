import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../api/rick_and_morty_api.dart';
import '../constants.dart';
import '../models/character.dart';

class DownloadController extends GetxController {
  final RickAndMortyHomePage rickAndMortyHomePage;
  late Box<CharactersBox> charactersBox;

  var charactersList = <CharactersInfo>[].obs;
  var isLoad = false.obs;

  DownloadController(
    this.rickAndMortyHomePage,
  );

  @override
  void onInit() async {
    super.onInit();
    fetchCharacterList();
    charactersBox = Hive.box<CharactersBox>(characters);
    final box = charactersBox.get(charactersBox);
    charactersBox.add(CharactersBox());
    box?.save();
    print(charactersBox.length);
  }

  Future<void> fetchCharacterList() async {
    try {
      isLoad.value = true;
      charactersList.value = await rickAndMortyHomePage.getCharacters();
    } on RickAndMortException catch (e) {
      Get.snackbar('O_o', e.toString());
    }
  }
}
