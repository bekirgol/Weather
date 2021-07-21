import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/src/model/weather-model.dart';
import 'package:weather/src/view-model/weather-view-model.dart';
import 'package:weather/src/view/component/card.dart';

class WeatherPage extends StatelessWidget {
  final String controller;
  WeatherPage({required this.controller});
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(controller),
      ),
      body: FutureBuilder<Weather>(
        future: data.getWeather(controller),
        builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.result!.length,
            itemBuilder: (BuildContext context, int index) {
              return CardComponent(
                img: snapshot.data!.result![index].icon,
                date: snapshot.data!.result![index].date,
                day: snapshot.data!.result![index].day,
                degree: snapshot.data!.result![index].degree,
                description: snapshot.data!.result![index].description,
                max: snapshot.data!.result![index].max,
                min: snapshot.data!.result![index].min,
              );
            },
          );
        },
      ),
    );
  }
}
