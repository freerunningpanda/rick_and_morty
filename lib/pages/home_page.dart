import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  late final Character characters;
  bool isLoad = false;

  @override
  void initState() {
    fetchCharacter();
    super.initState();
  }

  Future<void> fetchCharacter() async {
    var response = await dio.get('https://rickandmortyapi.com/api/character');
    characters = Character.fromJson(response.data);
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
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  color: Colors.orange[50],
                  child: ListTile(
                    leading: CircleAvatar(),
                    trailing: Text('trailing'),
                    title: Text('title'),
                    subtitle: Text('subtitle'),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}
