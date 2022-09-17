import 'package:flutter/cupertino.dart';
import 'package:moives_app/models/Response.dart';
import 'package:moives_app/services/Popular.dart';
import 'package:moives_app/services/topRated.dart';


class HomeBodyVM extends ChangeNotifier {
  List<Movie?>? popular = [];
  List<Movie?>? topRated = [];
  bool isPopularLoading = false;
  bool isTopRatedLoading = false;
  String popularErrorMess = '';
  Movie? mostPopular;
  HomeBodyVM() {
    print('home body constructor is starting now');
    getPopular();
    print('get popular is finished & popular length is : ${popular?.length}'
        ' & most popular movie title is :,'
        ' get top rated will be run');
    getTopRated();
    print('get top rated is finished & popular length is : ${topRated?.length}');
  }

  changeIsPopularLoading(bool value) {
    isPopularLoading = value;
    notifyListeners();
  }

  changeIsTopRatedLoading(bool value) {
    isTopRatedLoading = value;
    notifyListeners();
  }

  getPopular() async {
    changeIsPopularLoading(true);
    var res = await PopularSV.getPopularMovieList();
    print('this is result for get popular : $res');
    if (res is List<Movie>?) {
      popular = res;
      mostPopular = popular![0];
    } else {
      popularErrorMess = res;
      print('this is result for get popular value of popularErrorMess:');
    }
    changeIsPopularLoading(false);
  }

  getTopRated() async {
    changeIsTopRatedLoading(true);

    var res = await TopRatedSV.getTopRatedMovieList();
    if (res is List<Movie>?) {
      topRated = res;
    }
    changeIsTopRatedLoading(false);
  }

  String languageCompleteWord(String movieLanguage) {
    return 'language : ${movieLanguage == 'es' ? 'spanish' : movieLanguage == 'en' ? 'english' : movieLanguage == 'hi' ? 'hindi' : movieLanguage == 'ar' ? 'arabic' : movieLanguage == 'fa' ? 'persian' : movieLanguage == 'fr' ? 'french' : movieLanguage} ';
  }
}