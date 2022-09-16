import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../model/movieDetails.dart';
import 'constants.dart';


class APIServices{

  Future<List<Result>?> getMoviesBySearch(String query)async{
        Uri url = Uri.parse('${APIConstants.baseUrl}${APIConstants.searchEndpoint}'
            'api_key=${APIConstants.apiKey}&query=$query');
        http.Response response = await http.get(url);
        MovieDetails body = MovieDetails.fromJson(jsonDecode(response.body));
        if(response.statusCode >=200 && response.statusCode<300){
          print("sucsses");
          print(body.totalResults);
         print( body.results![10].title);
          return body.results;
        }else{
          Fluttertoast.showToast(
              msg: body.statusMessage??'',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
          return null;
        }
  }
}