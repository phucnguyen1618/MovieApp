import 'package:flutter_movie_app/models/author_detail.dart';

class Review {
  String author = '';
  AuthorDetail? authorDetail;
  String content = '';
  String createAt = '';
  String id = '';
  String updateAt = '';
  String url = '';

  Review.fromJson(Map<String, dynamic> json){
    author = json['author'];
    authorDetail = AuthorDetail.fromJson(json['author_details']);
    content = json['content'];
    createAt = json['created_at'];
    id = json['id'];
    updateAt = json['updated_at'];
    url = json['url'];
  }
}