import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
  ServiceLocator().init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: const MainMoviesScreen(),
    );
  }
}
