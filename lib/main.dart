import 'package:flutter/material.dart';

import 'MainScreen/MainScreen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Health Calculator",
    home: MainScreen(),
  ),);
}