import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td/provider/message_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xabarlar"),
      ),
      body: ListView.builder(
        itemCount: context.watch<MessageProvider>().messages.length,
        itemBuilder: (context, index) {
          final messageProvider = context.watch<MessageProvider>();
          return ListTile(
            onTap: () {
              messageProvider.derement(index);
            },
            tileColor: !messageProvider.messagesStatus[index]
                ? Colors.lightBlue[50]
                : Colors.white,
            title: Text(messageProvider.messages[index]),
          );
        },
      ),
    );
  }
}
