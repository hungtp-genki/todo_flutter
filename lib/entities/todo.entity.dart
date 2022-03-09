import 'package:hive/hive.dart';

part "todo.entity.g.dart";

@HiveType(typeId: 0)
class TodoEntity extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  TodoEntity(this.id);

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }

  static TodoEntity fromJson(Map<String, dynamic> json) {
    return TodoEntity(json["id"] as String).withName(json["name"] as String);
  }

  TodoEntity withName(String name) {
    name = name;
    return this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is TodoEntity && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
