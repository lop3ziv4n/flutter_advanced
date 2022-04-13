import 'package:http/http.dart' as http;

import '../models/character.dart';

class CharacterProvider {
  Future<ResponseData> getCharacters({page = 1}) async {
    final response = await http.get(
        Uri.https('rickandmortyapi.com', '/api/character', {'page': '$page'}));
    return responseDataFromJson(response.body);
  }
}
