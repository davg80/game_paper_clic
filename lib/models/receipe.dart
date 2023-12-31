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
  String? color;
  String? picture;
  bool? enable;

  Resource(
      {required this.name,
      required this.quantity,
      this.color,
      this.picture,
      this.enable});

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        name: json["name"],
        quantity: json["quantity"],
        color: json["color"],
        picture: json["picture"],
        enable: json["enable"],
      );

  Map<String, dynamic> toJson() => {"name": name, "quantity": quantity};
  @override
  String toString() {
    if (color != null && picture != null) {
      return '{name: $name, quantity: $quantity, color: $color, picture: $picture, enable: $enable}';
    }
    return '{name: $name, quantity: $quantity}';
  }
}
