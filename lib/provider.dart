
//provider.dart
import 'package:flutter/material.dart';

class UserData with ChangeNotifier {

  late String _name;
  late String _email;

  String get name => _name;
  String get email => _email;

  setName(String name) {
    _name = name;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}