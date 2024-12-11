import 'package:flutter/material.dart';

class GroupProvider extends ChangeNotifier {
  GroupProvider() {
    unreadGroupNotifications = groupNotifications.length;
  }

  void markGroupNotificationAsRead(int index) {
    if (groupNotifications.isNotEmpty) {
      groupNotificationsStatus[index] = true;
      if (unreadGroupNotifications > 0) {
        unreadGroupNotifications--;
      }
      notifyListeners();
    }
  }

  List<String> groupNotifications = [
    "Guruh yangilandi",
    "Yangi a'zo qo'shildi",
    "Guruhda yangi xabar mavjud",
  ];
  List<bool> groupNotificationsStatus = [false, false, false];
  int unreadGroupNotifications = 0;
}
