import 'package:flutter/material.dart';
import 'package:moives_app/screens/searchScreen.dart';

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
        searchScreen.routeName:(_)=> searchScreen(),},
      initialRoute: searchScreen.routeName,
    );
  }
}
