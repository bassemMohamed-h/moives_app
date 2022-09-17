import 'package:flutter/material.dart';

class searchVM extends ChangeNotifier{
  static String searchResult = '';


  static bool getSearchNotFoundIcon(){
    if(searchResult.trim()==''){return true;}
    return false;
  }
}