import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/character_info_controller.dart';

class CharacterInfo extends StatelessWidget {
  final int characterId;
  const CharacterInfo({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CharacterInfoController(characterId));
    final controller = Get.find<CharacterInfoController>();
    return Obx(
      () => !controller.isLoad.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Colors.orange[50],
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  controller.character.name,
                ),
                backgroundColor: Colors.grey[800],
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      CachedNetworkImage(
                        imageUrl: controller.character.image,
                        placeholder: (context, url) =>
                            Image.asset('assets/img.jpg'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Status:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.character.status.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Species:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.character.species.name),
                      const SizedBox(height: 10),
                      const Text(
                        'Gender:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.character.gender.name),
                      const SizedBox(height: 10),
                      const Text(
                        'Origin:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.character.origin.name),
                      const SizedBox(height: 10),
                      const Text(
                        'Location:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.character.location.name),
                      const SizedBox(height: 10),
                      const Text(
                        'First episode:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.character.episode.first),
                      const SizedBox(height: 10),
                      const Text(
                        'Last episode:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(controller.character.episode.last),
                      const SizedBox(height: 10),
                      const Text(
                        'Created:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('${controller.character.created}'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
