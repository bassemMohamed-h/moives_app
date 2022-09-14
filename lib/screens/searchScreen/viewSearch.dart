import 'package:flutter/material.dart';
import 'package:moives_app/screens/searchScreen/viewModelSearch.dart';

class viewSearch extends StatefulWidget {
  static String routeName = 'viewSearch';
  @override
  State<viewSearch> createState() => _viewSearchState();
}

class _viewSearchState extends State<viewSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121312),
        body: Container(
          color: Color(0xff121312),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search,color: Colors.white70,),
                ),
                onChanged: (result){
                  viewModelSearch.searchResult = result;
                  setState((){});
                },
              ),
              Expanded(child: viewModelSearch.getSearchNotFoundIcon()?
              Center(child: Image.asset('assets/images/noMoviesFoundIcon.png')):
              Center(child: Text('data',style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      );
  }
}