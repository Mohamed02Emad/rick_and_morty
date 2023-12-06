import 'package:dio/dio.dart';
import 'package:rick_and_morty/utils/api_constants.dart';
import 'package:rick_and_morty/utils/constants.dart';

import '../models/responses/characters_response.dart';

class CharactersService{
  late Dio dio;

  CharactersService(){
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 12) ,
      receiveTimeout: const Duration(seconds: 12) ,
    );

    dio = Dio(options);
   }

   Future<CharactersResponse?> getAllCharacters() async {
    try {
      final response = await dio.get(CHARACTERS_END_POINT);
      return CharactersResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e){
      print("$DEBUG_TAG getting characters crash: ${e.toString()}");
      return null;
    }
   }


}