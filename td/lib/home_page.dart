import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td/presentation/friends.dart';
import 'package:td/presentation/group.dart';
import 'package:td/presentation/message.dart';
import 'package:td/provider/group_page.dart';
import 'package:td/provider/kanal_page.dart';
import 'package:td/provider/message_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider'larni olish
    final messageProvider = context.watch<MessageProvider>();
    final groupProvider = context.watch<GroupProvider>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Telegram"),
          bottom: TabBar(
            tabs: [
              // "Friends" tab'i
              Tab(
                icon: Stack(
                  children: [
                    const Icon(Icons.chat_bubble),
                    if (messageProvider.newMessagesCount > 0) // Yangi xabarlar sonini ko'rsatadi
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                          child: Text(
                            messageProvider.newMessagesCount.toString(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                text: "Dostlar",
              ),
              // "Chat" tab'i
              Tab(
                icon: Stack(
                  children: [
                    const Icon(Icons.person),
                    if (messageProvider.newMessagesCount > 0)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                          child: Text(
                            messageProvider.newMessagesCount.toString(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                text: "Xabarlar",
              ),
              // "Group" tab'i
              Tab(
                icon: Stack(
                  children: [
                    const Icon(Icons.group),
                    if (groupProvider.unreadGroupNotifications > 0)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                          child: Text(
                            groupProvider.unreadGroupNotifications.toString(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                text: "Guruhlar",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FriendsPage(),  
            MessagePage(),  
            GroupPage(),    
          ],
        ),
      ),
    );
  }
}
