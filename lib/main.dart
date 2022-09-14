import 'package:flutter/material.dart';
import 'package:moives_app/screens/searchScreen/viewSearch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes:{
        viewSearch.routeName:(_)=> viewSearch(),},
      initialRoute: viewSearch.routeName,
    );
  }
}
