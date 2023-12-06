import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/data/api/characters_service.dart';
import 'package:rick_and_morty/data/repository/characters_repository/CharactersRepository.dart';
import 'package:rick_and_morty/presentation/screens/character_details_screen/character_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/utils/constants.dart';

class AppRouter {
  late final CharactersRepository _repository;

  late final CharactersCubit _cubit;

  AppRouter() {
    _repository = CharactersRepository(CharactersService());
    _cubit = CharactersCubit(_repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext ctx) => _cubit,
            child: const CharactersScreen(),
          ),
        );
      case Constants.CHARACTER_DETAILS_SCREEN:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());

    }
  }
}
