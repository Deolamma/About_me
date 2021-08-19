import 'package:flutter/material.dart';

class LogoDisplay extends StatelessWidget {
  const LogoDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width,
            child: Text(
              'https://training.zuri.team',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Container(
            height: size.height * 0.15,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Asset/images/zuriI4G.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('Asset/images/HNG.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
