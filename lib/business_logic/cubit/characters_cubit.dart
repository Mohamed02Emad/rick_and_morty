import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/models/responses/characters_response.dart';
import 'package:rick_and_morty/data/repository/characters_repository/CharactersRepository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;
  CharactersResponse? charactersResponse;

  CharactersCubit(this.repository) : super(CharactersInitial());

  List<Character>? getAllCharacters(){
    repository.getAllCharacters().then((value) => (charactersResponse){
      emit(CharactersLoaded(charactersResponse));
      this.charactersResponse = charactersResponse;
    });
    return charactersResponse?.results;
  }
}
