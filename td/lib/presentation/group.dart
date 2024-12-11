import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td/provider/group_page.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guruhlar"),
      ),
      body: ListView.builder(
        itemCount: context.watch<GroupProvider>().groupNotifications.length,
        itemBuilder: (context, index) {
          final groupProvider = context.watch<GroupProvider>();
          return ListTile(
            onTap: () {
              groupProvider.markGroupNotificationAsRead(index);
            },
            tileColor: !groupProvider.groupNotificationsStatus[index]
                ? Colors.lightGreen[50]
                : Colors.white,
            title: Text(groupProvider.groupNotifications[index]),
          );
        },
      ),
    );
  }
}
