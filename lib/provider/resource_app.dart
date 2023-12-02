import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_paper_clic/models/receipe.dart';

class ResourceApp extends ChangeNotifier {
  Color woodColor = const Color.fromRGBO(150, 121, 105, 1);
  Color ironOreColor = const Color.fromRGBO(206, 212, 218, 1);
  Color copperOreColor = const Color.fromRGBO(217, 72, 15, 1);
  Color coalColor = const Color.fromRGBO(0, 0, 0, 1);
  int wood = 0;
  int ironOre = 0;
  int copperOre = 0;
  int coal = 0;

  void incrementWood() {
    wood++;
    notifyListeners();
  }

  void incrementIronOre() {
    ironOre++;
    notifyListeners();
  }

  void incrementCopperOre() {
    copperOre++;
    notifyListeners();
  }

  void incrementCoal() {
    coal++;
    notifyListeners();
  }

  int getTotal() {
    return wood + ironOre + copperOre + coal;
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
