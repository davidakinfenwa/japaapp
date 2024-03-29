import 'package:flutter/material.dart';

class AccountPageProvider extends ChangeNotifier {
  String _educationType = "";
  String get educationType => _educationType;
  set educationType(String edu) {
    _educationType = edu;
    notifyListeners();
  }

  String _scaleType = "";
  String get scaleType => _scaleType;
  set scaleType(String edu) {
    _scaleType = edu;
    notifyListeners();
  }

    String _marrageType = "";
  String get marrageType => _marrageType;
  set marrageType(String marriage) {
    _marrageType = marriage;
    notifyListeners();
  }
}
