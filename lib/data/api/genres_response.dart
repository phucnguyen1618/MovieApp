import 'package:flutter_movie_app/models/genres.dart';

class GenresResponse {
  List<Genres> genresList;
  String error = '';

  GenresResponse.fromJson(Map<String, dynamic> json)
      : genresList = (json['genres'] as List)
            .map((item) => Genres.fromJson(item))
            .toList(),
        error = '';

  GenresResponse.withError(String errorValue)
      : genresList = [],
        error = errorValue;
}
