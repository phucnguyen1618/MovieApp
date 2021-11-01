import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesGenresBloc {
  MovieRepository repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMoviesByGenres(int id) async {
    MovieResponse response = await repository.getMoviesListWithGenres(id);
    _subject.sink.add(response);
  }

  Stream<MovieResponse> get movieGenresStream => _subject.stream;

  void drainStream() {
    _subject.valueOrNull == null;
  }

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final moviesByGenresBloc = MoviesGenresBloc();
