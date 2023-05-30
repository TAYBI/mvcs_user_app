import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  List<String> _userPosts = [];

  List<String> get userPosts => _userPosts;

  set userPosts(List<String> userPosts) {
    _userPosts = userPosts;
    notifyListeners();
  }
  // Eventually other stuff would go here, appSettings, premiumUser flags, currentTheme, etc...
}
