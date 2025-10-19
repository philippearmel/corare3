import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/chat_card.dart';
import '../models/chat.dart';
import '../widgets/custom_scaffold.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - in a real app, this would come from a service
    final chats = [
      Chat(
        id: '1',
        otherUserId: '1',
        otherUserName: 'Emily Walker',
        otherUserProfileImageUrl: '',
        lastMessage: 'Hey, I red this very interesting article...',
        lastMessageTime: DateTime.now().subtract(Duration(hours: 15)),
        unreadCount: 2,
        isOnline: true,
      ),
      Chat(
        id: '2',
        otherUserId: '2',
        otherUserName: 'Priya Nair',
        otherUserProfileImageUrl: '',
        lastMessage: 'How are you feeling lately?',
        lastMessageTime: DateTime.now().subtract(Duration(hours: 15)),
        unreadCount: 1,
        isOnline: true,
      ),
      Chat(
        id: '3',
        otherUserId: '3',
        otherUserName: 'Thomas Bauer',
        otherUserProfileImageUrl: '',
        lastMessage: 'Thought you would be interested in reading...',
        lastMessageTime: DateTime.now().subtract(Duration(hours: 15)),
        unreadCount: 1,
        isOnline: true,
      ),
    ];

    return CustomScaffold(
      appBar: const AppHeader(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ChatCard(chat: chats[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
