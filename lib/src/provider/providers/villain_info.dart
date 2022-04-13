import 'package:flutter/material.dart';

class VillainInfo with ChangeNotifier {
  String _villain = 'Red Skull';

  String get villain {
    return _villain;
  }

  set villain(String name) {
    _villain = name;

    notifyListeners();
  }
}
