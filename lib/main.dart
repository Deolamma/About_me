import 'package:flutter/material.dart';
import 'package:task_2/constants.dart';

import './Screens/mainScreen.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor,secondary: Colors.amber),
        
      ),
      home: MainScreen()
    );
  }
}



