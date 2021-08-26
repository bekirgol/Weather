import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/src/view-model/weather-view-model.dart';
import 'package:weather/src/view/weather-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/img.jpeg'),
            TextField(
              decoration: InputDecoration(hintText: 'Şehir Giriniz'),
              controller: data.cityController,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WeatherPage(
                        controller: data.cityController.text,
                      ),
                    ),
                  );
                },
                child: Text('Onayla'))
          ],
        ),
      ),
    );
  }
}
