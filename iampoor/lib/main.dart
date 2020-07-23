import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        centerTitle: true,
        // ,
        title: Text('I Am Poor'),
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Center(
        child: Image(image: AssetImage('images/poor.png')),
      ),
    )),
  );
}
