import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moives_app/ThemeData.dart';
import 'package:provider/provider.dart';
import 'HomeFragments/Views/home.dart';
import 'ViewModel/WatchListVM.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => WatchListVM(),
      builder: (context, child) {
        return MyApp();
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: MyThemeData.theme, home: Home());
  }
}
