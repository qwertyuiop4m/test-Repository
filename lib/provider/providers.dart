import 'dart:convert';

import 'package:httpapi/model/accid.dart';
import 'package:http/http.dart' as http;

class AccidentProviders{
  Uri uri = Uri.parse("http://localhost:8080/accident");

  Future<List<Accident>> getAccident() async {
    List<Accident> accident = [];

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      accident = jsonDecode(response.body)['articles'].map<Accident>( (article) {
        return Accident.fromMap(article);
      }).toList();
    }

    return accident;
  }


}