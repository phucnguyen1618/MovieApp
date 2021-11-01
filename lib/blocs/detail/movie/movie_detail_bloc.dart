import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_detail_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class MovieDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailResponse> _subject = BehaviorSubject<MovieDetailResponse>();

  getMovieDetail(int id) async {
    MovieDetailResponse response = await _repository.getMovieDetail(id);
    _subject.sink.add(response);
  }

  Stream<MovieDetailResponse> get movieDetailStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
final detailMovieBloc = MovieDetailBloc();