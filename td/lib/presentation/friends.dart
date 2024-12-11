import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td/provider/friends_page.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Do'stlar"),
      ),
      body: ListView.builder(
        itemCount: context.watch<FriendsProvider>().friends.length,
        itemBuilder: (context, index) {
          final friendsProvider = context.watch<FriendsProvider>();
          return ListTile(
            onTap: () {
              friendsProvider.toggleFriendStatus(index);
            },
            tileColor: friendsProvider.friendsStatus[index]
                ? Colors.lightGreen[50]
                : Colors.white,
            title: Text(friendsProvider.friends[index]),
            trailing: Icon(
              friendsProvider.friendsStatus[index]
                  ? Icons.online_prediction
                  : Icons.offline_bolt,
              color: friendsProvider.friendsStatus[index]
                  ? Colors.green
                  : Colors.red,
            ),
          );
        },
      ),
    );
  }
}
