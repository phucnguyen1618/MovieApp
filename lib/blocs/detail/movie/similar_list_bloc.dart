import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class SimilarMoviesBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getSimilarList(int id) async {
    MovieResponse response = await _repository.getSimilarMoviesList(id);
    _subject.sink.add(response);
  }

  Stream<MovieResponse> get similarStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final similarBloc = SimilarMoviesBloc();
