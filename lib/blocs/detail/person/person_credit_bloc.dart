import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_credits_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class KnowForBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieCreditResponse> _subject = BehaviorSubject<MovieCreditResponse>();

  getMoviesListPersonCredit(int id) async {
    MovieCreditResponse response = await _repository.getMoviePersonCredit(id);
    _subject.sink.add(response);
  }

  Stream<MovieCreditResponse> get personCreditStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
final knowForBloc = KnowForBloc();
