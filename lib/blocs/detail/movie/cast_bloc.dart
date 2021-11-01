import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/cast_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class CastBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getCast(int id) async {
    CastResponse response = await _repository.getCasts(id);
   _subject.sink.add(response);
  }

  Stream<CastResponse> get castStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final castBloc = CastBloc();
