// form_state_provider.dart
import 'package:flutter/material.dart';

class FormStateProvider with ChangeNotifier {
  String _ownerName = '';

  String get ownerName => _ownerName;

  void setOwnerName(String value) {
    _ownerName = value;
    notifyListeners();
  }
}
