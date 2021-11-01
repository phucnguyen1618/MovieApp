import 'package:flutter_movie_app/models/cast.dart';

class CastResponse {
  List<Cast> casts;
  String error = '';

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts = (json['cast'] as List).map((item) => Cast.fromJson(item)).toList(),
        error = '';

  CastResponse.withError(String value)
      : casts = [],
        error = value;
}
