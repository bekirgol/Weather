import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/model/weather-model.dart';

class WeatherViewModel extends ChangeNotifier {
  TextEditingController cityController = TextEditingController();

  Future<Weather> getWeather(String city) async {
    String url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city';
    final response = await http.get(Uri.parse(url), headers: {
      'authorization': 'apikey 2eCvY8zJFkAcaoZ9dQoOsw:06MIvg2PQlZPLQvuh8fY7T',
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      final result = weatherFromJson(response.body);
      return result;
    } else {
      return Weather();
    }
  }

  // @override
  // List getWeather() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List> getWeather() async {
  //   String url =
  //       'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city';
  //   final response = await http.get(Uri.parse(url), headers: {
  //     'authorization': 'apikey 2eCvY8zJFkAcaoZ9dQoOsw:06MIvg2PQlZPLQvuh8fY7T',
  //     'content-type': 'application/json',
  //   });
  //   if (response.statusCode == 200) {
  //     final result = weatherFromJson(response.body);
  //     return result;
  //   } else {
  //     return Weather();
  //   }
  // }

  // @override

}
