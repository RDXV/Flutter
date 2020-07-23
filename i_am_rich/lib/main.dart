import 'package:flutter/material.dart';

// This is a flutter app making the MaterialApp which is going to be i am rich app
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "I am Rich",
            textAlign: TextAlign.center,
          ),
//          backgroundColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Image(
            // image: NetworkImage(
            //     'https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753'),
            image: AssetImage('images/diamond.png'),
          ),
        ),
      ),
    ),
  );
}
