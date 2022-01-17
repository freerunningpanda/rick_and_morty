import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'api/src/rick_and_morty_api.dart';
import 'controllers/homepage_controller.dart';
import 'models/character.dart';
import 'pages/home_page.dart';
import 'constants.dart';

const bool cleanStateOnRestart = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(CharactersInfoAdapter());
  Hive.registerAdapter(CharactersBoxAdapter());
  Hive.registerAdapter(LocationAdapter());
  if (cleanStateOnRestart) {
    await Hive.deleteBoxFromDisk(characters);
  }
  await Hive.openBox<CharactersBox>(characters);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rickAndMortyProvider = RickAndMortyProvider();
    Get.lazyPut(() => HomePageController(rickAndMortyProvider));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        rickAndMortyProvider: rickAndMortyProvider,
      ),
    );
  }
}
