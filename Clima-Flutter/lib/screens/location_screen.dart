import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  // dynamic

  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
//1

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  // store temperature not as double but int to show the whole number and not decimals

  String cityName;
  String weatherIcon, weatherMessage;
  WeatherModel weather = WeatherModel();
  // You get access to widget which is corresponding stateful widget instance
  @override
  void initState() {
    super.initState();
    updateData(widget.locationWeather);
    // print(widget.locationWeather);
  }

  // Now as weather changes, they also need to change and so store them inside setstate
  void updateData(dynamic weatherData) {
    // If you turn off location services inside the app, it crashes and so to avoid it check if weatherData not null
    // else display something else or print
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '';
        weatherMessage = 'Unable to find the location';
        cityName = '';
        return;
        // Use the empty return statement to end the function and it can be used inside any function in dart
      }
      var temp = weatherData['main']['temp'];
      // if -> double temp =... then error as int not subtype of double but if changed to var, solved

      int t = temp.round();
      temperature = t;
      var id = weatherData['weather'][0]['id'];

      weatherIcon = weather.getWeatherIcon(id);
      cityName = weatherData['name'];

      weatherMessage = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocation();
                      updateData(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      // print(typedName);
                      //IMPORTANT to check whether null or not
                      if (typedName != null) {
                        var data = await weather.getCityWeather(typedName);
                        updateData(data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      // '☀️',
                      weatherIcon,

                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  // "It's 🍦 time in $cityName!",
                  // using double quotes as apostrophe. or can use It\'s which would mean same
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 1 - So now you initialise the LocationScreen() inside the above function but how do you access the data inside the
// LocationScreenState widget given below.
// We need to display the weatherinformation from the loading screen isndie the text widget of locationScreen which
// means getting data from LocationScreen object to  LocationScreenState object. We can do it as locationScreen and
// LocationScreenState are linked. One such property is 'widget' where the element of the stateful widget points
// to parent state widget

// Note that we are doing this because our LocationScreenState widget is private  in nature as to avoid changes  by user
// because the weather should be shown by server and not dependent or changeable by user
