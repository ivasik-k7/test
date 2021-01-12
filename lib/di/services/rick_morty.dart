import 'dart:convert' as convert;
import 'package:chatex/di/models/rick_chars_model.dart';
import 'package:http/http.dart' as http;

class BaseService {
  static String baseUrl = 'https://rickandmortyapi.com/api';
  static String route = '/character?page=3';

  Future getListOfItems({Function setter}) async {
    var response = await http.get(baseUrl + route);
    if (response.statusCode == 200) {
      List<MovieCharModel> results = [];
      var jsonResponse = convert.jsonDecode(response.body);

      for (int i = 0; i < jsonResponse['results'].length; i++) {
        var item = jsonResponse['results'][i];
        results.add(MovieCharModel(
            id: item['id'],
            gender: item['gender'],
            name: item['name'],
            species: item['species'],
            type: item['type'],
            origin: MovieCharOriginModel(
                name: item['origin']['name'], url: item['origin']['url']),
            location: MovieCharLocation(
                name: item['location']['name'], url: item['location']['url']),
            imageURI: item['image']));
      }

      if (setter != null) {
        setter(results);
      }

      return results;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future getElementById(String id) async {
    var response = await http.get(baseUrl + route + '/$id');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
