import 'package:flutter_movie_app/models/review.dart';

class ReviewsResponse {
  List<Review> reviewList;
  String error;

  ReviewsResponse.fromJson(Map<String, dynamic> json)
      : reviewList = (json['results'] as List)
            .map((item) => Review.fromJson(item))
            .toList(),
        error = '';

  ReviewsResponse.withError(String message)
      : reviewList = [],
        error = message;
}
