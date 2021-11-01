import 'package:flutter_movie_app/models/person.dart';

class PersonResponse {
  int page = 0;
  List<Person> personList;
  int totalPages = 0;
  int totalResults = 0;
  String error = '';

  PersonResponse.fromJson(Map<String, dynamic> json)
      : personList = (json['results'] as List)
            .map((item) => Person.fromJson(item))
            .toList(),
        error = '';

  PersonResponse.withError(String errorValue)
      : personList = [],
        error = errorValue;
}
