import 'package:flutter/material.dart';
import 'package:moives_app/API/apiServices.dart';
import 'package:moives_app/screens/viewModelSearch.dart';

import '../model/movieDetails.dart';

class searchScreen extends StatefulWidget {
  static String routeName = 'viewSearch';
  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  List<Result> movies = [];
  APIServices apiServices = APIServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121312),
        body: Container(
          color: const Color(0xff121312),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: Colors.white70,),
                ),
                onChanged: (query){
                  apiServices.getMoviesBySearch(query);
                  setState((){});
                },
              ),
              Expanded(child: ViewModelSearch.getSearchNotFoundIcon()?
              Center(child: Image.asset('assets/images/noMoviesFoundIcon.png')):
              const Center(child: Text('data',style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      );
  }
}