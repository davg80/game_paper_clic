import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_paper_clic/models/receipe.dart';

class ResourceApp extends ChangeNotifier {
  Color woodColor = const Color.fromRGBO(150, 121, 105, 1);
  Color ironOreColor = const Color.fromRGBO(206, 212, 218, 1);
  Color copperOreColor = const Color.fromRGBO(217, 72, 15, 1);
  Color coalColor = const Color.fromRGBO(0, 0, 0, 1);
  Resource wood = Resource(name: 'wood', quantity: 0);
  Resource ironOre = Resource(name: 'iron-ore', quantity: 0);
  Resource copperOre = Resource(name: 'copper-ore', quantity: 0);
  Resource coal = Resource(name: 'coal', quantity: 0);

  List<Receipe> inventory = [];
  List<Receipe> receipeList = [];
  List<Resource> resourceActual = [];
  Map<int, dynamic> resourceinventoryNecessary = {};

  void incrementWood() {
    wood.quantity++;
    activateProductionWithResource(wood);
    // print(receipeList);
    notifyListeners();
  }

  void incrementIronOre() {
    ironOre.quantity++;
    activateProductionWithResource(ironOre);
    notifyListeners();
  }

  void incrementCopperOre() {
    copperOre.quantity++;
    activateProductionWithResource(copperOre);
    notifyListeners();
  }

  void incrementCoal() {
    coal.quantity++;
    activateProductionWithResource(coal);
    notifyListeners();
  }

  int getTotal() {
    return wood.quantity +
        ironOre.quantity +
        copperOre.quantity +
        coal.quantity;
  }

  void activateProductionWithResource(Resource resource) {
    resourceinventoryNecessary.forEach((receipeId, resources) {
      if (resources.length == 1 && resources[0].name == resource.name) {
        // print(
        //     'compare quantity  : ${ironOre.quantity >= resources[0].quantity}');
        // print('ironOre quantity  : ${ironOre.quantity}');
        // print('resource quantity  : ${resources[0].quantity}');
        // print('key: $receipeId, value: $resources');
        if (resource.quantity >= resources[0].quantity) {
          findReceipe(receipeId).completed = true;
        }
      }
    });
  }

  Receipe findReceipe(int id) =>
      receipeList.firstWhere((receipe) => receipe.id == id);

  // Receipes
  Future _loadData() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final listOfJsonElements = json.decode(jsonString) as List<dynamic>;
    return listOfJsonElements
        .map((element) => Receipe.fromJson(element))
        .toList();
  }

  setReceipeList() async {
    if (receipeList.isEmpty) {
      receipeList = await _loadData();
      if (receipeList.isNotEmpty) {
        for (var receipe in receipeList) {
          resourceinventoryNecessary[receipe.id] = receipe.resources;
        }
        resourceActual.add(wood);
        resourceActual.add(ironOre);
        resourceActual.add(copperOre);
        resourceActual.add(coal);
      }
    }
    // print(receipeList);
  }

  void setInventory(Receipe receipe) {
    inventory.add(receipe);
    print(inventory);
    notifyListeners();
  }
}
