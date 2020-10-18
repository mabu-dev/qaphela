import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qaphelaMobile/model/checkCase.dart';
import 'package:qaphelaMobile/model/perpetrator.dart';

class MyApi {
  static final domain = '192.168.8.104';
  static final baseUrl = "http://$domain:8001/api/";

  Future<List<CheckCase>> getCases() async {
    final url = baseUrl + 'cases/';
    http.Response res = await http.get(url, headers: _setHeaders());
    List<dynamic> cases = json.decode(res.body);
    return cases.map((i) => CheckCase.fromJson(i)).toList();
  }

  Future<List<Perpetrators>> getAbusers() async {
    final url = baseUrl + 'abusers/';
    http.Response res = await http.get(url, headers: _setHeaders());
    List<dynamic> perpetrator = json.decode(res.body);
    return perpetrator.map((i) => Perpetrators.fromJson(i)).toList();
  }

  Future<List<CheckCase>> getAbuser(name) async {
    final url = baseUrl + 'case-check/$name/';
    http.Response res = await http.get(url, headers: _setHeaders());
    List<dynamic> perpetrator = json.decode(res.body);
    return perpetrator.map((i) => CheckCase.fromJson(i)).toList();
  }

  Future<List<CheckCase>> updateCase(CheckCase updatedCase) async {
    final caseUrl = baseUrl + 'api/case/${updatedCase.id}/';
    http.Response res =
        await http.post(caseUrl, headers: _setHeaders(), body: updatedCase);
    List<dynamic> cases = json.decode(res.body);
    return cases.map((i) => CheckCase.fromJson(i)).toList();
  }

  Map<String, String> _setHeaders() => <String, String>{
        'Accept': 'application/json',
      };
}
