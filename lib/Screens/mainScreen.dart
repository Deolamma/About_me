import 'package:flutter/material.dart';
import 'package:task_2/Widget/logodisplayWidget.dart';
import '../Widget/userInputAndDisplayWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Me'),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InputDisplayWidget(),
          LogoDisplay(),
        ],
      ),
    );
  }
}
