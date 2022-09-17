import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../Models/response.dart';
import 'constants.dart';


class SearchAPI{

  Future<List<Movie>?> getMoviesBySearch(String query)async{
    if (query.trim()=='') return null;
    Uri url = Uri.parse('${APIConstants.baseUrl}${APIConstants.searchEndpoint}'
        'api_key=${APIConstants.apiKey}&query=$query');
    http.Response response = await http.get(url);
    Response body = Response.fromJson(jsonDecode(response.body));
    if(response.statusCode >=200 && response.statusCode<300){
      print("successes");
      print('total pages : ${body.totalResults}');
      print( 'title name from result: ${body.results![0].title}');
      return body.results;
    }else{
      print('something went wrong ');
      Fluttertoast.showToast(
          msg: body.status_message??'',
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