import 'package:flutter/material.dart';
class MovieListPage extends StatefulWidget {
  MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Film'),
      ),
      body: Center(
        child: Text('Ini adalah halaman daftar film.'),
      ),
    );
  }
}

