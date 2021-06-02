import 'package:demo/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomeScreen(),
   );
  }
  
}