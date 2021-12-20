import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/pages/character_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  var characters = <CharactersInfo>[];
  bool isLoad = false;

  @override
  void initState() {
    fetchCharacterList();
    super.initState();
  }

  Future<void> fetchCharacterList() async {
    var response = await dio.get('https://rickandmortyapi.com/api/character');
    var results = response.data['results'] as List<dynamic>;
    for (var it in results) {
      characters.add(CharactersInfo.fromJson(it));
    }
    setState(() {});
    isLoad = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoad
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) {
                final item = characters[index];
                return Material(
                  color: Colors.orange[50],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.image),
                    ),
                    trailing: Text(item.status.name),
                    title: Text(item.name),
                    subtitle: Text(item.species.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CharacterInfo(
                                  characterId: item.id,
                                )),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
