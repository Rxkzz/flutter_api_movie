import 'package:flutter/material.dart';// Import model Movie
import 'package:flutter_application_1/pages/movie_list.dart'; // Import halaman MovieListPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MovieListPage(), // Mengganti MyHomePage dengan MovieListPage
      },
    );
  }
}
