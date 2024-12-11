import 'package:flutter/material.dart';

class FriendsProvider extends ChangeNotifier {
  FriendsProvider() {
    onlineFriendsCount = friends.length;
  }

  void toggleFriendStatus(int index) {
    if (friends.isNotEmpty) {
      friendsStatus[index] = !friendsStatus[index];
      onlineFriendsCount += friendsStatus[index] ? 1 : -1;
      notifyListeners();
    }
  }

  List<String> friends = [
    "Ali",
    "Anora",
    "Otabek",
    "Zuhra",
  ];

  List<bool> friendsStatus = [false, false, false, false];
  int onlineFriendsCount = 0;
}
