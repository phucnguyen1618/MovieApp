import 'package:flutter_movie_app/models/genres.dart';

class MovieDetail {
  int id = 0;
  bool adult = false;
  String? backdropPath = '';
  int budget = 0;
  List<Genres> genresList = List.empty(growable: true);
  String overview = '';
  double popularity = 0.0;
  String? posterPath = '';
  String releaseDate = '';
  int runtime = 0;
  String title = '';
  String originalTitle = '';
  double voteAverage = 0.0;
  int voteCount = 0;

  MovieDetail(
      this.id,
      this.adult,
      this.backdropPath,
      this.budget,
      this.genresList,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.runtime,
      this.title,
      this.originalTitle,
      this.voteAverage,
      this.voteCount);

  MovieDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'] ?? "/eeijXm3553xvuFbkPFkDG6CLCbQ.jpg";
    budget = json['budget'];
    genresList =
        (json['genres'] as List).map((e) => Genres.fromJson(e)).toList();
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] ?? "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg";
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    title = json['title'];
    originalTitle = json['original_title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
