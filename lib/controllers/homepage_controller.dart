import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../api/rick_and_morty_api.dart';
import '../constants.dart';
import '../models/character.dart';

class HomePageController extends GetxController {
  final RickAndMortyHomePage rickAndMortyHomePage;
  late Box<CharactersBox> charactersBox;

  var charactersList = <CharactersInfo>[];
  var isLoad = false.obs;

  HomePageController(
    this.rickAndMortyHomePage,
  );

  @override
  void onInit() async {
    super.onInit();
    charactersBox = Hive.box<CharactersBox>(charactersListBox);
    if (charactersBox.containsKey(charactersListBox)) {
      final box = charactersBox.get(charactersListBox);
      charactersList = box!.charactersInfo;
    } else {
      var isGood = await fetchCharacterList();
      if (isGood) {
        var temp = CharactersBox();
        temp.charactersInfo = charactersList;
        charactersBox.put(charactersListBox, temp);
      }
    }
    isLoad.value = true;
    print(charactersBox.length);
  }

  Future<bool> fetchCharacterList() async {
    try {
      charactersList = await rickAndMortyHomePage.getCharacters();
      return true;
    } on RickAndMortException catch (e) {
      Get.snackbar('O_o', e.toString());
    }
    return false;
  }
}
