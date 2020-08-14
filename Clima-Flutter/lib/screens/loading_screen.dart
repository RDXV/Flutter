import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //1

  // double latitude, longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('This line of code is triggered');
    // currentLocation.getLocation();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocation();
    // Make sure putting awaits at right times

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
    //4
  }

  //3
  @override
  Widget build(BuildContext context) {
    String myMargin = '5';
    double doubleMargin;

    try {
      doubleMargin = double.parse(myMargin);
    }
    //2

    catch (e) {
      //e is the error or exception
      print(e);
      // DoubleMargin = 20.0;
    }
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),

      //5
    );
  }
}

// To avoid return scaffold again, we can isolate the part which can possibly go wrong and if wrong, return a default value

//1 -  async and await is the way to carry out time consuming tasks such as asking phone for current location, getting it
// back and then processing it and showing it takes time and resources
// void getLocation() async {
//   try {
//     Position position = await Geolocator().getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//         locationPermissionLevel: GeolocationPermission.location);
//     print(position);
//   } catch (e) {
//     print(e);
//   }
// }

// Location currentLocation = Location();

// 2 - If Double Margin not inside the try block then also error

// body: Center(
//   child: RaisedButton(
//     onPressed: () {
//       //Get the current location
//       getLocation();
//     },
//     child: Text('Get Location'),
//   ),
// ),

// 3 -  print(response.body);

// var longitude = jsonDecode(response.body)['coord']['lon'];
// print(longitude);
// var weatherCondition =
//     jsonDecode(response.body)['weather'][0]['description'];

// print(weatherCondition);

// var decodedData = jsonDecode(response.body);
// var as we not know whether int,double or anything else
// int id = decodeData['weather'][0]['id'];

// 4 - print('cityname is $cityName');
// print('id is $id');
// print('temperature is $temperature');
// inside gelocation and not  scaffold so as to get location first and not give null latitude and longitude

// void getData() async {
// Future response as we  dont know what it will return. Will also require async and await
// http.Response response = await http.get(
//     'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=469d4b804bc8187953eb36d2a8c26a02');

// http.Response response = await http.get(
//     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikKey');
// print(response.body);

// print(response.statusCode);
// if (response.statusCode == 200) {

// double temperature = jsonDecode(response.body)['main']['temp'];

// int id = jsonDecode(response.body)['weather'][0]['id'];
// String cityName = jsonDecode(response.body)['name'];
// print('cityname is $cityName');
// print('id is $id');
// print('temperature is $temperature');
// 0 as 1  item given and we  have to givethe index  to access the inside
// } else {
// print(response.statusCode);
// }
// }

// 5 - Container(
//   color: Colors.blue,
//   margin: EdgeInsets.all(doubleMargin ?? 20.0),
//   // Null Aware Operator
//   // This means  that if DoubleMargin cannot  be used then use 20 otherwise us the old value
// ),
