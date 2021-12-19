import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterInfo extends StatefulWidget {
  final int characterId;
  const CharacterInfo({Key? key, required this.characterId}) : super(key: key);

  @override
  _CharacterInfoState createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  var dio = Dio();
  late CharactersInfo character;
  bool isLoad = false;

  @override
  void initState() {
    fetchCharacter(widget.characterId);
    super.initState();
  }

  Future<void> fetchCharacter(int id) async {
    var response =
        await dio.get('https://rickandmortyapi.com/api/character/$id');
    character = CharactersInfo.fromJson(response.data);
    setState(() {});
    isLoad = true;
  }

  @override
  Widget build(BuildContext context) {
    return !isLoad
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.orange[50],
            appBar: AppBar(
              title: Center(
                child: Text(
                  character.name,
                ),
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
                      imageUrl: character.image,
                      placeholder: (context, url) =>
                          Image.asset('assets/img.jpg'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Status:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      character.status.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Species:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(character.species.name),
                    const SizedBox(height: 10),
                    const Text(
                      'Gender:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(character.gender.name),
                    const SizedBox(height: 10),
                    const Text(
                      'Origin:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(character.origin.name),
                    const SizedBox(height: 10),
                    const Text(
                      'Location:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(character.location.name),
                    const SizedBox(height: 10),
                    const Text(
                      'First episode:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(character.episode.first),
                    const SizedBox(height: 10),
                    const Text(
                      'Last episode:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(character.episode.last),
                    const SizedBox(height: 10),
                    const Text(
                      'Created:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('${character.created}'),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
  }
}
