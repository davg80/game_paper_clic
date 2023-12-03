import 'dart:convert';

List<Receipe> receipeFromJson(String str) =>
    List<Receipe>.from(json.decode(str).map((x) => Receipe.fromJson(x)));

String receipeToJson(List<Receipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Receipe {
  String name;
  int id;
  String picture;
  List<Resource> resources;
  String type;
  String description;
  bool completed;

  Receipe({
    required this.name,
    required this.id,
    required this.picture,
    required this.resources,
    required this.type,
    required this.description,
    required this.completed,
  });

  factory Receipe.fromJson(Map<String, dynamic> json) => Receipe(
        name: json["name"],
        id: json["id"],
        picture: json["picture"],
        resources: List<Resource>.from(
            json["resources"].map((x) => Resource.fromJson(x))),
        type: json["type"],
        description: json["description"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "picture": picture,
        "resources": List<dynamic>.from(resources.map((x) => x.toJson())),
        "type": type,
        "description": description,
        "completed": completed,
      };

  @override
  String toString() {
    return '{name: $name,id: $id,picture: $picture,resources: $resources,type: $type,description: $description,completed: $completed}';
  }
}

class Resource {
  String name;
  int quantity;

  Resource({
    required this.name,
    required this.quantity,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
  @override
  String toString() {
    return '{name: $name, quantity: $quantity}';
  }
}
