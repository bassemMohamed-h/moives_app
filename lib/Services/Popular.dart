import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moives_app/models/Response.dart';

class PopularSV {
  static getPopularMovieList() async {
    String popularURL =
        'https://api.themoviedb.org/3/movie/latest?api_key=8dbbda94d23f032c5242000cb0e9c458&language=en-US';
    var response = await http.get(Uri.parse(popularURL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
