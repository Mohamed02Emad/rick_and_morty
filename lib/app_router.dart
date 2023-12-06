import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/screens/character_details_screen/character_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/utils/constants.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case Constants.HOME_SCREEN :
        return MaterialPageRoute(builder: (_)=> const CharactersScreen() );
      case Constants.CHARACTER_DETAILS_SCREEN :
        return MaterialPageRoute(builder: (_)=> const CharacterDetailsScreen() );
      // case '/':
      // case '/':
      // case '/':
    }
  }
}