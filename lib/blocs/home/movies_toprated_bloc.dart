import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class TopRatedBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMoviesTopRated();
    _subject.sink.add(response);
  }

  Stream<MovieResponse> get topRatedStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final topRatedBloc = TopRatedBloc();
