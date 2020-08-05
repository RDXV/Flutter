import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  ReusableContainer({this.colour, this.cardChild});

  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      // Name child as cardchild
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // color: Color(0xFF1D1E33),
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
