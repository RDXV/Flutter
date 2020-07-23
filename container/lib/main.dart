import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.red,
              ),
              SizedBox(
                width: 45.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.green,
                    ),
                  ],
                ),
                // height: 100.0,
                // width: 100.0,
                // color: Colors.purple[400],
              ),
              SizedBox(
                width: 45.0,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
              ),
              // Container(
              //   width: double.infinity,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
