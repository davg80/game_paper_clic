import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_paper_clic/models/receipe.dart';

class ResourceApp extends ChangeNotifier {
  Color woodColor = const Color.fromRGBO(150, 121, 105, 1);
  Color ironOreColor = const Color.fromRGBO(206, 212, 218, 1);
  Color copperOreColor = const Color.fromRGBO(217, 72, 15, 1);
  Color coalColor = const Color.fromRGBO(0, 0, 0, 1);
  Resource wood = Resource(
    name: 'wood',
    quantity: 0,
    color: '#967969',
    picture: 'assets/images/wood.png',
    enable: true,
  );
  Resource ironOre = Resource(
    name: 'iron-ore',
    quantity: 0,
    color: '#ced4da',
    picture: 'assets/images/iron-ore.png',
    enable: true,
  );
  Resource copperOre = Resource(
    name: 'copper-ore',
    quantity: 0,
    color: '#d9480F',
    picture: 'assets/images/copper-ore.png',
    enable: true,
  );
  Resource coal = Resource(
    name: 'coal',
    quantity: 0,
    color: '#000000',
    picture: 'assets/images/coal.png',
    enable: false,
  );

  List<Receipe> inventory = [];
  List<Receipe> receipeList = [];
  List<Resource> currentResources = [
    Resource(
        name: 'wood',
        quantity: 0,
        color: '#967969',
        picture: 'assets/images/wood.png'),
    Resource(
        name: 'iron-ore',
        quantity: 0,
        color: '#ced4da',
        picture: 'assets/images/iron-ore.png'),
    Resource(
        name: 'copper-ore',
        quantity: 0,
        color: '#d9480F',
        picture: 'assets/images/copper-ore.png'),
    Resource(
        name: 'coal',
        quantity: 0,
        color: '#000000',
        picture: 'assets/images/coal.png')
  ];
  Map<int, dynamic> resourceinventoryNecessary = {};

  void increment(int index) {
    currentResources[index].quantity++;
    activateProductionWithResource(currentResources[index]);
    // print(receipeList);
    notifyListeners();
  }

  int getTotal() {
    int sum = 0;
    for (var resource in currentResources) {
      sum += resource.quantity;
    }
    return sum;
  }

  void activateProductionWithResource(Resource resource) {
    resourceinventoryNecessary.forEach((receipeId, resources) {
      if (resources.length == 1 && resources[0].name == resource.name) {
        if (resource.quantity >= resources[0].quantity) {
          findReceipe(receipeId).completed = true;
        }
      }
    });
  }

  Receipe findReceipe(int id) =>
      receipeList.firstWhere((receipe) => receipe.id == id);

  Resource findResource(String searchName) =>
      currentResources.firstWhere((resource) => resource.name == searchName);

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
      }
    }
    // print(receipeList);
  }

  void setInventory(Receipe receipe) {
    inventory.add(receipe);
    var regularResources = receipe.resources;
    resourceinventoryNecessary.forEach((receipeId, resources) {
      if (resources.length == 1 &&
          resources[0].name == regularResources[0].name) {
        if (regularResources[0].quantity == 1) {
          findReceipe(receipeId).completed = false;
        }
      }
    });
    findResource(receipe.resources[0].name).quantity--;
    // print(inventory);
    notifyListeners();
  }
}
