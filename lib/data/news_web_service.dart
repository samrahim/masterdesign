import 'dart:convert';

import 'package:http/http.dart' as http;

class WebService {
  String url = '';
  Future<Map> getMap(String category) async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=628982d32a6b41b98242d1553565778c'));
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);

      return map;
    } else {
      return {"error": "some where?"};
    }
  }
}
