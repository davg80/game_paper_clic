// To parse this JSON data, do
//
//     final receipe = receipeFromJson(jsonString);

import 'dart:convert';

List<Receipe> receipeFromJson(String str) =>
    List<Receipe>.from(json.decode(str).map((x) => Receipe.fromJson(x)));

String receipeToJson(List<Receipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Receipe {
  String name;
  int id;
  Resources resources;
  String type;
  String description;
  bool completed;

  Receipe({
    required this.name,
    required this.id,
    required this.resources,
    required this.type,
    required this.description,
    required this.completed,
  });

  factory Receipe.fromJson(Map<String, dynamic> json) => Receipe(
        name: json["name"],
        id: json["id"],
        resources: Resources.fromJson(json["resources"]),
        type: json["type"],
        description: json["description"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "resources": resources.toJson(),
        "type": type,
        "description": description,
        "completed": completed,
      };
}

class Resources {
  int? wood;
  int? metalRod;
  int? ironOre;
  int? copperOre;
  int? ironIngot;
  int? copperIngot;
  int? ironPlate;
  int? electricWire;
  int? metalPlate;

  Resources({
    this.wood,
    this.metalRod,
    this.ironOre,
    this.copperOre,
    this.ironIngot,
    this.copperIngot,
    this.ironPlate,
    this.electricWire,
    this.metalPlate,
  });

  factory Resources.fromJson(Map<String, dynamic> json) => Resources(
        wood: json["Wood"],
        metalRod: json["Metal rod"],
        ironOre: json["Iron-ore"],
        copperOre: json["Copper-ore"],
        ironIngot: json["Iron ingot"],
        copperIngot: json["Copper ingot"],
        ironPlate: json["Iron plate"],
        electricWire: json["Electric wire"],
        metalPlate: json["Metal plate"],
      );

  Map<String, dynamic> toJson() => {
        "Wood": wood,
        "Metal rod": metalRod,
        "Iron-ore": ironOre,
        "Copper-ore": copperOre,
        "Iron ingot": ironIngot,
        "Copper ingot": copperIngot,
        "Iron plate": ironPlate,
        "Electric wire": electricWire,
        "Metal plate": metalPlate,
      };
}
