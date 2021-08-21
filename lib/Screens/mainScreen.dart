import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          AspectRatio(
            aspectRatio: 5 / 3,
            child: Image.asset('Asset/images/zuriI4G.png'),
          ),
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset('Asset/images/HNG.png'),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          InputDisplayWidget(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                if (await canLaunch(zuriLink)) {
                  await launch(zuriLink);
                } else {
                  throw 'can\'t launch $zuriLink';
                }
              },
              child: Text(
                zuriLink,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
