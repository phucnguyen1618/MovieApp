class AuthorDetail {
  String name = '';
  String username = '';
  String? avatarPath = '';
  double? rating = 0.0;

  AuthorDetail.fromJson(Map<String, dynamic> json){
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }
}