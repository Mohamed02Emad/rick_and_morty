import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/responses/characters_response.dart';
import 'package:rick_and_morty/data/repository/characters_repository/CharactersRepository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository repository;

  CharactersCubit(this.repository) : super(CharactersInitial());

  Future<void> getAllCharacters(String? text) async {
    var charactersResponse = await repository.getAllCharacters();
    if (text != null && text.isNotEmpty) {
      charactersResponse?.results = charactersResponse.results
          ?.where((element) => element.name?.contains(text) ?? false)
          .toList();
    }
    emit(CharactersLoaded(charactersResponse));
  }
}
