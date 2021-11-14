import 'package:flutter_movie_app/models/movie.dart';

class MovieResponse {
  List<Movie> movieList = [];
  String error = '';

  MovieResponse();

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movieList = (json['results'] as List)
            .map((item) => Movie.fromJson(item))
            .toList(),
        error = '';

  MovieResponse.withError(String errorValue)
      : movieList = [],
        error = errorValue;
}
