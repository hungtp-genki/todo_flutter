class Entity {
  late String id;
  late String name;
  late bool done;
  Entity(this.id, this.name, this.done);
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "done": done};
  }

  static Entity fromJson(Map<String, dynamic> json) {
    return Entity(
        json["id"] as String, json["name"] as String, json["done"] as bool);
  }
}
