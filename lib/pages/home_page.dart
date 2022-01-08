import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/download_controller.dart';
import '../pages/character_info.dart';
import '../api/rick_and_morty_api.dart';

class HomePage extends StatelessWidget {
  final RickAndMortyProvider rickAndMortyProvider;
  const HomePage({Key? key, required this.rickAndMortyProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DownloadController>();
    return Obx(
      () => Scaffold(
        body: !controller.isLoad.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.characters.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = controller.characters[index];
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
