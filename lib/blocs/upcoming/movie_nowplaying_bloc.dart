import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieNowPlayingBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getNowPlayingMovie() async {
    MovieResponse response = await _repository.getNowPlaying();
    _subject.sink.add(response);
  }

  Stream<MovieResponse> get nowPlayingStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
final nowPlayingBloc = MovieNowPlayingBloc();