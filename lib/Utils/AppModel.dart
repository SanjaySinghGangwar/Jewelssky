import 'package:flutter/foundation.dart';
import 'package:jewelssky/Utils/mUtils.dart';

class AppModel with ChangeNotifier {
  String appBarTitle = mUtis().appName;
  bool _isLoading = false;

  String get getappBarTitle => appBarTitle;

  bool get isLoading => _isLoading;

  void updateTitle(String title) {
    appBarTitle = title;
    notifyListeners();
  }

  void loadingToggle(bool status) {
    _isLoading = status;
    notifyListeners();
  }
}