import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/movie_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';

class SearchMovieProvider extends ChangeNotifier {
  final MovieRepository _repository = MovieRepository();
  MovieResponse _movieResponse = MovieResponse();

  MovieResponse get getResponse => _movieResponse;

  void searchMovie(String keyword) async {
    _movieResponse = await _repository.getResults(keyword);
    notifyListeners();
  }
}
