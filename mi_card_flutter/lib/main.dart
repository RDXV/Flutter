import 'package:flutter/material.dart';

// Pubsec Yaml has image and fonts added
void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Will align everything center
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/v.jpg'),
                radius: 50.0,
              ),
              Text(
                // IMPORTANT
                'V Company',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'APP DEVELOPER ',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  color: Colors.teal[100],
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                // margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                // padding: EdgeInsets.all(10.0),
                color: Colors.white,
                // Cards by default have color as white
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.call,
                      color: Colors.teal,
                      size: 25.0,
                    ),
                    title: Text(
                      '+91 123 456 789 0',
                      style: TextStyle(
                        color: Colors.teal[800],
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                // Cards dont have padding but containers do have so for cards we need to wrap items to be padded with
                //padding class
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                // padding: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail_outline,
                      color: Colors.teal,
                      size: 25.0,
                    ),
                    title: Text(
                      'abcd@email.com',
                      style: TextStyle(
                        color: Colors.teal[800],
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 20.0,
              child: Text('Image to be entered here'),
            ),
            Container(
              height: 30.0,
              child: Text('My Name in nice font'),
            ),
            Container(
              height: 30.0,
              child: Text('the name of organization'),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    color: Colors.white,
                    child: Text('Contact No. - 983509346'),
                  ),
                  Container(
                    height: 30.0,
                    width: 30.0,
                    color: Colors.white,
                    child: Text('mail id - nkfajg@fakg.com'),
                  ),
                ],
              ),
            )
          ],
        )),

*/

/*
 Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      size: 25.0,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '+91 123 456 789 0',
                      style: TextStyle(
                        fontFamily: 'Source Sans pro',
                        fontSize: 15,
                        color: Colors.teal[800],
                      ),
                    ),
                  ],
                ),


 Row(
                  // Margin and padding
                  children: <Widget>[
                    Icon(
                      Icons.mail_outline,
                      color: Colors.teal,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'abcd@email.com',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal[800],
                      ),
                    ),
                  ],
                ),
                */
