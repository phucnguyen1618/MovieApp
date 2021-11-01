import 'dart:core';

class Movie {
  String? backdropPath;
  int id = 0;
  String overview = '';
  double popularity = 0.0;
  String? posterPath;
  String title = '';
  double voteAverage = 0.0;
  int voteCount = 0;
  String releaseDate = '';
  String originalLanguage = '';

  Movie(this.backdropPath, this.id, this.overview, this.popularity,
      this.posterPath, this.title, this.voteAverage, this.voteCount);

  Movie.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'] ?? "/eeijXm3553xvuFbkPFkDG6CLCbQ.jpg";
    id = json['id'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] ?? "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg";
    title = json['title'];
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'];
    releaseDate = json['release_date'];
    originalLanguage = json['original_language'];
  }
}
