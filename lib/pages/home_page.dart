import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';
import '../pages/character_info.dart';
import '../api/rick_and_morty_api.dart';

class HomePage extends StatelessWidget {
  final RickAndMortyProvider rickAndMortyProvider;
  const HomePage({Key? key, required this.rickAndMortyProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();
    return Obx(
      () => Scaffold(
        body: !controller.isLoad.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.charactersList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.charactersList[index];
                  return Material(
                    color: Colors.orange[50],
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.image),
                      ),
                      trailing: Text(item.status),
                      title: Text(item.name),
                      subtitle: Text(item.species),
                      onTap: () {
                        Get.to(
                          () => CharacterInfo(
                            characterId: item.id,
                            rickAndMortyCharacter: rickAndMortyProvider,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
