import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

// The void main() => runApp(...) has this arrow function .
// The arrow function is ( => ) equal to ( { return ...} ) but note that only 1 argument can be passed
// inside the arrow . Such as print(n1 + n2).
// int add(n1 , n2 ) => n1 + n2
// the above function returns n1 + n2 but if we change it such as
// int add(n1,n2) => print('Hello'); n1+n2;
// That is an error as it can have only 1 function argument

// Note - even though void main( runapp(...)) does not return anything, it works similarly to
// void main() => runapp(...)

// To add a  flutter package, find it on web, find the right way to install, put it inside dependencies
// and then import inside the dart code
class XylophoneApp extends StatelessWidget {
  void playsound(int a) {
    final player = AudioCache();
    player.play('note$a.wav');
  }

  Expanded buildkey(Color color, int sound) {
// instead of return type of Widget, it  can have return type of Expanded as returning Expanded
// widget in this case

    // Each build key  is void and so cannot be used as they must return the expanded widget rather than just
    // initialising it
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playsound(sound);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // children: <Widget>[
            children: [
              buildkey(Colors.red, 1),
              buildkey(Colors.orange, 2),
              buildkey(Colors.yellow, 3),
              buildkey(Colors.green, 4),
              buildkey(Colors.teal, 5),
              buildkey(Colors.blue, 6),
              buildkey(Colors.purple, 7),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.red,
              //     onPressed: () {
              //       playsound(1);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.orange,
              //     onPressed: () {
              //       playsound(2);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.yellow,
              //     onPressed: () {
              //       playsound(3);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.green,
              //     onPressed: () {
              //       playsound(4);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.teal,
              //     onPressed: () {
              //       playsound(5);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.blue,
              //     onPressed: () {
              //       playsound(6);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: FlatButton(
              //     color: Colors.purple,
              //     onPressed: () {
              //       playsound(7);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget xylophone(Color color, int sound) {
//   return Expanded(
//     child: FlatButton(
//       color: color,
//       onPressed: () {
//         final player = AudioCache();
//         player.play('note$sound.wav');
//       },
//     ),
//   );
// }
