import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  MessageProvider() {
    newMessagesCount = messages.length;
  }

  void derement(int index) {
    if (messages.isNotEmpty) {
      messagesStatus[index] = true;
      if (newMessagesCount >= 0) {
        newMessagesCount--;
      }
      notifyListeners();
    }
  }

  List<String> messages = [
    "Salom",
    "Ish taklifi",
    "Intervyu muvaffaqiyatli o'tdi!"
    
  ];
  List<bool> messagesStatus = [false, false, false];
  int newMessagesCount = 0;
}
