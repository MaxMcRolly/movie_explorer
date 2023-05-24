import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_explorer/imports.dart';

HttpRepository httpRepository = HttpRepository();

class HttpRepository {
  final apiKey = 'k_ny3o94wb';
  final baseUrl = 'https://imdb-api.com/API';

  Future<List<MovieShort>> searchMovies(String query) async {
    List<MovieShort> movies = [];
    final url = Uri.parse('$baseUrl/searchmovie/$apiKey/$query');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["errorMessage"].toString().isNotEmpty) {
        throw Exception('Failed to search movies');
      }
      print(response.body);
      for (Map<String, dynamic> movie in data["results"]) {
        movies.add(MovieShort.fromJson(movie));
      }

      return movies;
    } else {
      throw Exception('Failed to search movies');
    }
  }

  Future<MovieFull> getMovieDetails(String id) async {
    final url = Uri.parse('$baseUrl/title/$apiKey/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(response.body);
      return MovieFull.fromJson(data);
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
