import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qaphelaMobile/model/checkCase.dart';

class MyApi {
  static final domain = '192.168.8.100';
  static final baseUrl = "http://$domain:8001";

Future<CheckCase> getCase() async {
  http.Response res = await http.get('/api/cases/');
  print('getCase res: ${res.toString()}');
    Map<String, dynamic> map = jsonDecode(res.body);
    return CheckCase.fromJson(map);
}
  // Future<String> profile() async {
  //   final login = baseUrl + '/deepuser/';
  //   http.Response _response = await http.get(login, headers: _setHeaders());

  //   Map<String, dynamic> map = jsonDecode(_response.body);
  //   return DeepUser.fromJson(map);
  // }
}
