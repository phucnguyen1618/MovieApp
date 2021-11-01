class Person {
  int id = 0;
  String name = '';
  String knownForDepartment = '';
  String profile = '';
  double popularity = 0.0;

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? 'Tom Hardy';
    knownForDepartment = json['known_for_department'] ?? 'Acting';
    profile = json['profile_path'] ?? '/kU3B75TyRiCgE270EyZnHjfivoq.jpg';
    popularity = json['popularity'];
  }
}
