import 'package:flutter_movie_app/models/person_detail.dart';

class PersonDetailResponse {
  PersonDetail personDetail;
  String error;

  PersonDetailResponse(this.personDetail, this.error);

  PersonDetailResponse.fromJson(Map<String, dynamic> json)
      : personDetail = PersonDetail.fromJson(json),
        error = '';

  PersonDetailResponse.withError(String value)
      : personDetail = PersonDetail(null, '', null, 0, '', 0, '', 0.0, null, null),
        error = value;
}
