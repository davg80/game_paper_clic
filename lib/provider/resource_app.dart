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

  void incrementWood() {
    wood.quantity++;
    notifyListeners();
  }

  void incrementIronOre() {
    ironOre.quantity++;
    notifyListeners();
  }

  void incrementCopperOre() {
    copperOre.quantity++;
    notifyListeners();
  }

  void incrementCoal() {
    coal.quantity++;
    notifyListeners();
  }

  int getTotal() {
    return wood.quantity +
        ironOre.quantity +
        copperOre.quantity +
        coal.quantity;
  }

  // Receipes
  Future loadData() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final listOfJsonElements = json.decode(jsonString) as List;
    return listOfJsonElements
        .map((jsonElement) => Receipe.fromJson(jsonElement))
        .toList();
  }
}
