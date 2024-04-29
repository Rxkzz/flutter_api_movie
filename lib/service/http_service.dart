import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/movie.dart';

class HttpService {
  final String apiKey = "8f36f017a63f24358c2fd326ce05c7d6";
  final String baseurl = "https://api.themoviedb.org/3/movie/popular?api_key=";

  Future<List<Movie>?> getPopularMovies() async {
    final String uri = baseurl + apiKey;
    http.Response response = await http.get(Uri.parse(uri));

    if (response.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponse = json.decode(response.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies = moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
