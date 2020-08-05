import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String calculate;
  final Function tap;

  BottomButton({@required this.calculate, this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      //  () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ResultPage()),
      //   );
      // },
      child: Container(
        child: Text(
          // 'CALCULATE',
          calculate,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        color: kBottomBarColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
