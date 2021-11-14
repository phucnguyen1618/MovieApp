import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/image_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class ImageBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<ImageResponse> _subject = BehaviorSubject<ImageResponse>();

  getImages(int movieId) async {
    ImageResponse response = await _repository.getImages(movieId);
    _subject.sink.add(response);
  }

  Stream<ImageResponse> get imageStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
final imageBloc = ImageBloc();