import 'package:flutter_movie_app/data/api/genres_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class GenresListBloc {
  MovieRepository repository = MovieRepository();
  final BehaviorSubject<GenresResponse> _subject =
      BehaviorSubject<GenresResponse>();

  getGenres() async {
    GenresResponse response = await repository.getAllGenres();
    _subject.sink.add(response);
  }

  Stream<GenresResponse> get genresStream => _subject.stream;

  dispose() {
    _subject.close();
  }
}

final genresBloc = GenresListBloc();
