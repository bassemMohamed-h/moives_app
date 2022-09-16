import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moives_app/models/Response.dart';

class MovieDetailsSV {
  static getSimilar(int id) async {
    String uRL =
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=8dbbda94d23f032c5242000cb0e9c458';
    var response = await http.get(Uri.parse(uRL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
