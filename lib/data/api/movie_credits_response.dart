import 'package:flutter_movie_app/models/movie.dart';

class MovieCreditResponse {
  List<Movie> movieList;
  String error = '';

  MovieCreditResponse.fromJson(Map<String, dynamic> json)
      : movieList =
            (json['cast'] as List).map((item) => Movie.fromJson(item)).toList(),
        error = '';

  MovieCreditResponse.withError(String contentError)
      : movieList = [],
        error = contentError;
}
