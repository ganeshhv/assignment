import 'dart:convert';

import 'package:assignment/models/comic_model.dart';
import 'package:http/http.dart' as http;

class ApiService
{

  var baseUrl = "https://xkcd.com";

  static var client = http.Client();

  Future serverGetComics(int index) async
  {
    print('api calling');
    final String path = '$baseUrl/$index/info.0.json';

    final response = await client.get(Uri.parse(path),
        headers: {
          "Content-Type": "application/json"
        });
    print('serverGetPublicReport header: $path');
    print('serverGetPublicReport status: ${response.statusCode}');
    print('serverGetPublicReport body: ${response.body}');

    if(response.statusCode != 200)
    {
      print('something went wrong!');
    }


    final json = jsonDecode(response.body);
    print('getComic result: $json');
    final result = Comic.fromJson(json);
    print('from apiService:-> ${result.runtimeType}');

    return result;
  }
}