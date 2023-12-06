import 'package:rick_and_morty/data/api/characters_service.dart';

import '../../../utils/constants.dart';
import '../../models/responses/characters_response.dart';

class CharactersRepository {

  late final CharactersService charactersService ;

  CharactersRepository(this.charactersService);

  Future<CharactersResponse?> getAllCharacters() async {

    final characters = await charactersService.getAllCharacters();
    return characters;

  }
}