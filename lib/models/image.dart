class Image{
  double ratio = 0.0;
  String imagePath = '';
  int height = 0;
  int width = 0;
  String error = '';

  Image.fromJson(Map<String, dynamic> json){
    ratio = json['aspect_ratio'];
    imagePath = json['file_path'];
    height = json['height'];
    width = json['width'];
  }
}