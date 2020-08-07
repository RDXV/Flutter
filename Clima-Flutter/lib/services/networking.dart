import 'package:http/http.dart' as http;
// Rather than response and get we can use http.Response and http.get
// To decode json files,we have to import dart:convert
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    // Future response as we  dont know what it will return. Will also require async and await
    // http.Response response = await http.get(
    //     'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=469d4b804bc8187953eb36d2a8c26a02');

    http.Response response = await http.get(url);
    // print(response.body);

    // print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // String decodeData = jsonDecode(response.body);
      // Do not return String as type unkown
      // return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
