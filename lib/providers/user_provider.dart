import 'package:flutter/material.dart';
import 'package:loan_xtimate/models/user_data.dart';

class UserProvder extends ChangeNotifier {
  final UserData userData = testUserData;
  bool isEditModeActive = false;

  void toggleEditMode() {
    if (isEditModeActive) {
      isEditModeActive = false;
    } else {
      isEditModeActive = true;
    }
    notifyListeners();
  }

  void activeEditMode() {
    isEditModeActive = true;
    notifyListeners();
  }
}
