class PersonDetail {
  String? birthday;
  String knownForDepartment = '';
  String? deathDay = '';
  int id = 0;
  String name = '';
  int gender = 0;
  String biography = '';
  double popularity = 0.0;
  String? placeOfBirth = '';
  String? profilePath;

  PersonDetail(
      this.birthday,
      this.knownForDepartment,
      this.deathDay,
      this.id,
      this.name,
      this.gender,
      this.biography,
      this.popularity,
      this.placeOfBirth,
      this.profilePath);

  PersonDetail.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    deathDay = json['deathday'];
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
  }
}