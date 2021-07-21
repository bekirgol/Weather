import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/view-model/weather-view-model.dart';
import 'src/view/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherViewModel>(
          create: (_) => WeatherViewModel(),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
