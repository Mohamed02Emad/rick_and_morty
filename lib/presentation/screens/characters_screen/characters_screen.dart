import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/api/characters_service.dart';
import 'package:rick_and_morty/data/repository/characters_repository/CharactersRepository.dart';
import 'package:rick_and_morty/utils/constants.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = CharactersRepository(CharactersService());
    var d = s.getAllCharacters();
    // print("$DEBUG_TAG not error\n${d!.toString()}");
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
