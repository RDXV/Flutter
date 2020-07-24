import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int a = 1, b = 1;
  void func() {
    setState(() {
      // a = (a++) % 6 + 1;
      // Random() is a random number generator and nextint is a widget
      a = Random().nextInt(6) + 1;
      b = Random().nextInt(6) + 1;
    });
    // return x;
  }

  @override
  Widget build(BuildContext context) {
    // Note that if the random numbers are declared inside the build(buildContext) then for each hot
    // reload, it will be declared again which is bad as memory allocated each time.
    // Setstate sees where thwe given variable inside the setstate is used and then changes th value as
    // given in setstate for all occurences of the variable
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            // by default flex =1
            child: FlatButton(
              onPressed: () {
                // print('First Dice');

                // a++;
                // With just a++ , this would not  work. We need to specifically specify the setstate. This is
                // because when dice number changes we want to call the widget build() again
                func();
                // Without setstate() the variable keeps on changing the value but the change on screen does
                // not occur as no  setstate
              },
              child: Image.asset('images/dice$a.png'),
            ),
            // height: 100.0,
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                // print('Second Dice');
                // Now wherever the setstate is used, it marks the items inside used as  dirty which means
                // that later the page only focuses on the value on the page that has changed
                // setState(() {
                //   // b = (b++) % 6 + 1;
                //   a = Random().nextInt(6) + 1;
                //   b = Random().nextInt(6) + 1;
                // });
                func();
              },
              child: Image.asset('images/dice$b.png'),
            ),
          ),
        ],
      ),
    );
  }
}
