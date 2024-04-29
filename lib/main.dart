import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/http_service.dart';
import 'package:flutter_application_1/models/movie.dart'; // Import model Movie

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
      home: MovieListPage(), // Mengganti MyHomePage dengan MovieListPage
    );
  }
}

class MovieListPage extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieListPage> {
  int? moviesCount; // Mengubah Int menjadi int dan menambahkan nullable dengan tanda '?'
  List<Movie>? movies; // Mengubah tipe List menjadi List<Movie> dan menambahkan nullable dengan tanda '?'
  String result = "";
  late HttpService service; // Menambahkan late untuk inisialisasi yang tertunda

  @override
  void initState() {
    super.initState();
    service = HttpService(); // Inisialisasi HttpService
    fetchMovies(); // Memanggil fungsi untuk mengambil data film
  }

void fetchMovies() async {
  var tempMovies = await service.getPopularMovies();
  if (tempMovies != null && tempMovies is List<Movie>) {
    movies = tempMovies;
    result = "Data berhasil diambil";
    moviesCount = movies!.length;
  } else {
    result = "Gagal mengambil data";
  }
  setState(() {});
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Popular Movies"),
    ),
    body: ListView.builder(
      itemCount: movies?.length ?? 0,
      itemBuilder: (context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(movies?[position].title ?? 'Tidak ada judul'),
            subtitle: Text(movies?[position].voteAverage.toString() ?? '0.0'),
          ),
        );
      },
    ),
  );
}

}