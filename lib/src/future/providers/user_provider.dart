import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider {
  Future<ResponseData> getUsers({page = 1}) async {
    final response =
        await http.get(Uri.https('reqres.in', '/api/users', {'page': '$page'}));
    return responseDataFromJson(response.body);
  }
}
