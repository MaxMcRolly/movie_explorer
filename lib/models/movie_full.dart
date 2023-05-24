import 'package:movie_explorer/imports.dart';

class MovieFull {
  String? id;
  String? title;
  String? year;
  String? image;
  String? runtime;
  String? plot;
  String? directors;
  String? stars;
  List<Actor> actors = [];
  List<SimilarMovie> similarMovies = [];
  String? imdbRating;
  String? metacriticRating;
  MovieFull.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    year = json["year"];
    image = json["image"];
    runtime = json["runtimeStr"];
    plot = json["plot"];
    directors = json["directors"];
    stars = json["stars"];
    for (Map<String, dynamic> actor in json["actorList"]) {
      actors.add(Actor.fromJson(actor));
    }
    for (Map<String, dynamic> similarMovie in json["similars"]) {
      similarMovies.add(SimilarMovie.fromJson(similarMovie));
    }
    imdbRating = json["imDbRating"];
    metacriticRating = json["metacriticRating"];
  }
}
