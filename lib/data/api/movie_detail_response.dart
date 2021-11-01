import 'package:flutter_movie_app/models/movie_detail.dart';

class MovieDetailResponse {
  MovieDetail detail;
  String error;

  MovieDetailResponse(this.detail, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : detail = MovieDetail.fromJson(json),
        error = '';

  MovieDetailResponse.withError(String errorValue)
      : error = errorValue,
        detail =
            MovieDetail(0, false, '', 0, [], '', 0.0, '', '', 0, '', '', 0.0, 0);
}
