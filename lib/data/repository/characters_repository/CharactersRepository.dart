import 'package:rick_and_morty/data/api/characters_service.dart';

import '../../../utils/constants.dart';
import '../../models/responses/characters_response.dart';

class CharactersRepository {

  late final CharactersService charactersService ;

  CharactersRepository(this.charactersService);

  Future<CharactersResponse?> getAllCharacters() async {
    final characters = await charactersService.getAllCharacters();
    // print("$DEBUG_TAG check if error");
    if (characters == null) return null;
    // print("$DEBUG_TAG passed the check");
    var char = CharactersResponse.fromJson(characters!);
    // print("$DEBUG_TAG response is :\n${char.results![2].name.toString()}");
    return char;
  }
}