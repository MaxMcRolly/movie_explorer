class SimilarMovie {
  String? id;
  String? title;
  String? image;
  String? rating;

  SimilarMovie.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    title = json["title"];
    rating = json["imDbRating"];
  }
}
