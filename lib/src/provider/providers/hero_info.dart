import 'package:flutter/material.dart';

class HeroInfo with ChangeNotifier {
  String _hero = 'Capitán América';
  Color colorBase = Colors.blue;

  String get hero {
    return _hero;
  }

  set hero(String name) {
    _hero = name;
    colorBase = (name == 'Ironman') ? Colors.red : Colors.blue;

    notifyListeners();
  }
}
