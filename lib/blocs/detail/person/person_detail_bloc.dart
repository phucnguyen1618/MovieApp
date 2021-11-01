import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/person_detail_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonDetailResponse> _subject = BehaviorSubject<PersonDetailResponse>();

  getPersonDetail(int id) async {
    PersonDetailResponse detailResponse = await _repository.getPersonDetail(id);
    _subject.sink.add(detailResponse);
  }

  Stream<PersonDetailResponse> get personDetailStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
final personDetailBloc = PersonDetailBloc();