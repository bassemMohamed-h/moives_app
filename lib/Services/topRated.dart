import 'dart:convert';
import 'package:moives_app/models/Response.dart';
import 'package:http/http.dart' as http;

class TopRatedSV {
  static getTopRatedMovieList() async {
    String topRatedURL =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=8dbbda94d23f032c5242000cb0e9c458&language=en-US&page=1';

    var response = await http.get(Uri.parse(topRatedURL));

    if (response.statusCode == 200) {
      Response moviesList = Response.fromJson(jsonDecode(response.body));

      return moviesList.results;
    } else {
      return 'Failed To Reach Server';
    }
  }
}
