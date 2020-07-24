import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: ballpage(),
      ),
    );

// class ballpage extends StatefulWidget {
//   @override
//   _ballpageState createState() => _ballpageState();
// }

// class _ballpageState extends State<ballpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: Text('Ask Me Anything'),
//       ),
//       body: Container(
//         child: Center(child: Image.asset('images/ball1.png')),
//       ),
//     );
//   }
// }

class ballpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Ask Me Anything'),
      ),
      body: ball(),
    );
  }
}

class ball extends StatefulWidget {
  @override
  _ballState createState() => _ballState();
}

class _ballState extends State<ball> {
  int ballno = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            print('i got clicked');
            setState(() {
              ballno = Random().nextInt(5) + 1;
            });
            // semicolon and not comma after statements
          },
          child: Image.asset('images/ball$ballno.png'),
        ),
      ),
    );
  }
}
