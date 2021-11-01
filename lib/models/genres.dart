class Genres {
   int id = 0;
   String name = '';

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
