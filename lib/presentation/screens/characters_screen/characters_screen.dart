import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/presentation/widgets/all_chars_screen/characters_list_widget.dart';
import 'package:rick_and_morty/presentation/widgets/common/loading_indicator.dart';
import 'package:rick_and_morty/utils/constants.dart';

import '../../../data/models/character.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // List<Character>? allCharacters;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    // print("$DEBUG_TAG from initState : ${allCharacters?.first.name}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Characters",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {

            return CharactersListWidget(state.data!.results);
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
