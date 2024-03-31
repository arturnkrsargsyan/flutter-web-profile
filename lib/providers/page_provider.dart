import 'package:flutter/cupertino.dart';

class PageProvider extends ChangeNotifier {
  int currentPageIndex = 0;
  bool isEditModeActive = false;
  bool isMinHeight = false;

  void toggleEditMode() {
    if (isEditModeActive) {
      isEditModeActive = false;
    } else {
      isEditModeActive = true;
    }
    notifyListeners();
  }

  void deactivateRemoveMode() {
    isEditModeActive = false;
    notifyListeners();
  }
}
