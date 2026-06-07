import 'package:flutter/foundation.dart';

class SelectedAlgorithm extends ChangeNotifier {
  String _algorithm = "Linear Search";

  String get algorithm => _algorithm;

  void setAlgorithm(String value) {
    _algorithm = value;
    notifyListeners();
  }
}