import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/chat_card.dart';
import '../data/chats_list_data.dart';
import '../widgets/custom_scaffold.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use data from lib/data instead of hardcoded data
    final chats = ChatsListData.chats;

    return CustomScaffold(
      appBar: const AppHeader(),
      body: Column(
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
    );
  }
}
