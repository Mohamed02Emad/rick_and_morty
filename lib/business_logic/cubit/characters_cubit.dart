import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/models/responses/characters_response.dart';
import 'package:rick_and_morty/data/repository/characters_repository/CharactersRepository.dart';
import 'package:rick_and_morty/utils/constants.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;


  CharactersCubit(this.repository) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    final charactersResponse = await repository.getAllCharacters();
        // .then((value) => (CharactersResponse charactersResponse){
      // print("$DEBUG_TAG  getAll  : ${charactersResponse.results?.first.name}");
      emit(CharactersLoaded(charactersResponse));
      // print("$DEBUG_TAG  getAll  : ${charactersResponse!.results?.first.name}");

  }

}
