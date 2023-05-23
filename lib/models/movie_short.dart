class MovieShort {
  String? id;
  String? image;
  String? title;
  String? description;

  MovieShort.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    title = json["title"];
    description = json["description"];
  }
}
