class Cast {
  int id = 0;
  String? name = '';
  String? knownForDepartment = '';
  String? profilePath = '';
  double popularity = 0.0;

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? 'Tom Hardy';
    knownForDepartment = json['known_for_department'] ?? 'Acting';
    profilePath = json['profile_path'] ?? '/kU3B75TyRiCgE270EyZnHjfivoq.jpg';
    popularity = json['popularity'];
  }
}
