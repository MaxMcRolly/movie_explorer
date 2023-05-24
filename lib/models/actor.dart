class Actor {
  String? id;
  String? image;
  String? name;
  String? character;
  Actor.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    name = json["name"];
    character = json["asCharacter"];
  }
}
