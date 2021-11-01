import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/reviews_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class ReviewsBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<ReviewsResponse> _subject = BehaviorSubject<ReviewsResponse>();

  getReviews(int idMovie) async {
    ReviewsResponse response = await _repository.getReviews(idMovie);
    _subject.sink.add(response);
  }

  Stream<ReviewsResponse> get reviewsStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
final reviewsBloc = ReviewsBloc();