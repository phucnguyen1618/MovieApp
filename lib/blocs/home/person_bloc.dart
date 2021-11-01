import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/api/person_response.dart';
import 'package:flutter_movie_app/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
      BehaviorSubject<PersonResponse>();

  getListPerson() async {
    PersonResponse response = await _repository.getTrendingListPerson();
    response.toString().isNotEmpty
        ? _subject.sink.add(response)
        : _subject.sink.addError("No response");
  }

  Stream<PersonResponse> get personStream => _subject.stream;

  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final personBloc = PersonBloc();
