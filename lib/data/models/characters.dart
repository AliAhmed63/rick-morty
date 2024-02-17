class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String origin;
  late String location;
  late String image;
  late List<dynamic> episode;
  late String url;
  late String creeated;

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"] ?? "test";
    status = json["status"] ?? "test";
    species = json["species"] ?? "test";
    type = json["type"] ?? "test";
    gender = json["gender"] ?? "test";
    origin = json["origin"]['name'] ?? "test";
    location = json["location"]['name'] ?? "test";
    image = json["image"] ?? "test";
    episode = json["episode"];
    url = json["url"] ?? "test";
    creeated = json["created"];
  }
}
