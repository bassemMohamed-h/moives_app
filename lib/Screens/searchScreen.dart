import 'package:flutter/material.dart';
import 'package:moives_app/Services/searchAPI.dart';
import 'package:moives_app/ViewModel/searchVM.dart';

import '../Models/response.dart';

class searchScreen extends StatefulWidget {
  static String routeName = 'viewSearch';
  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  List<Movie> movies = [];
  SearchAPI apiServices = SearchAPI();
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
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
              ),
              onChanged: (query) {
                apiServices.getMoviesBySearch(query);
                searchVM.searchResult = query;
                setState(() {});
              },
            ),
            Expanded(
              child: searchVM.getSearchNotFoundIcon()
                  ? Center(
                      child: Image.asset('images/noMoviesFound.png'))
                  : const Center(
                      child: Text(
                      'data',
                      style: TextStyle(color: Colors.white),
                    )),
            )
          ],
        ),
      ),
    );
  }
}
