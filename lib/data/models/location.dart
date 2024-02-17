class Location {
  late String name;
  late String type;
  late String dimension;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
  }
}
