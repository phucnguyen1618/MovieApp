import 'package:flutter_movie_app/models/image.dart';

class ImageResponse {
  List<Image> imageList = [];
  String error = '';

  ImageResponse.fromJson(Map<String, dynamic> json)
      : imageList = (json['posters'] as List)
            .map((item) => Image.fromJson(item))
            .toList(),
        error = '';

  ImageResponse.withError(String value)
      : error = value,
        imageList = [];
}
