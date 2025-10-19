import '../models/chat.dart';

class ChatsDetailsData {
  // Sample messages for different chats
  static final List<Message> priyaChatMessages = [
    Message(
      id: 'msg_1_1',
      chatId: '1',
      senderId: 'current_user',
      content:
          'Hi Priya! I saw your photography post about managing outdoor shoots with your condition. Really inspiring!',
      timestamp: DateTime.now().subtract(const Duration(days: 4, hours: 2)),
      isRead: true,
    ),
    Message(
      id: 'msg_1_2',
      chatId: '1',
      senderId: 'chat_user_1',
      content:
          'Thank you! It took a lot of trial and error to find what works. Are you dealing with similar challenges?',
      timestamp: DateTime.now().subtract(
        const Duration(days: 4, hours: 1, minutes: 45),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_1_3',
      chatId: '1',
      senderId: 'current_user',
      content:
          'Yes, I have a different condition but face similar limitations with outdoor activities. Your tips about shade planning were really helpful!',
      timestamp: DateTime.now().subtract(
        const Duration(days: 4, hours: 1, minutes: 30),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_1_4',
      chatId: '1',
      senderId: 'chat_user_1',
      content:
          'I\'m so glad! Would you like to exchange some packing lists? I have a great system for travel that works well with my skin.',
      timestamp: DateTime.now().subtract(
        const Duration(days: 4, hours: 1, minutes: 15),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_1_5',
      chatId: '1',
      senderId: 'current_user',
      content:
          'That would be amazing! I\'m planning a trip next month and could really use some practical advice.',
      timestamp: DateTime.now().subtract(const Duration(days: 4, hours: 1)),
      isRead: true,
    ),
    Message(
      id: 'msg_1_6',
      chatId: '1',
      senderId: 'chat_user_1',
      content:
          'Perfect timing! I\'ll send you my detailed packing checklist later today. It includes all the essentials for managing my condition while traveling.',
      timestamp: DateTime.now().subtract(const Duration(days: 4, minutes: 45)),
      isRead: true,
    ),
    Message(
      id: 'msg_1_7',
      chatId: '1',
      senderId: 'chat_user_1',
      content: 'Hji',
      timestamp: DateTime.now().subtract(const Duration(days: 4)),
      isRead: true,
    ),
  ];

  static final List<Message> emilyChatMessages = [
    Message(
      id: 'msg_2_1',
      chatId: '2',
      senderId: 'current_user',
      content:
          'Hi Emily! Congratulations on baby Noah! How are you adjusting to motherhood?',
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
      isRead: true,
    ),
    Message(
      id: 'msg_2_2',
      chatId: '2',
      senderId: 'chat_user_2',
      content:
          'Thank you! It\'s been challenging but wonderful. Managing my condition while caring for a newborn is definitely a learning curve.',
      timestamp: DateTime.now().subtract(
        const Duration(days: 2, hours: 2, minutes: 45),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_2_3',
      chatId: '2',
      senderId: 'current_user',
      content:
          'I can only imagine! Are you finding any particular strategies helpful for managing your energy levels?',
      timestamp: DateTime.now().subtract(
        const Duration(days: 2, hours: 2, minutes: 30),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_2_4',
      chatId: '2',
      senderId: 'chat_user_2',
      content:
          'Yes! I\'ve been working with my cardiologist to adjust my medication timing around Noah\'s schedule. Also, setting up a feeding station near my bed has been a game-changer.',
      timestamp: DateTime.now().subtract(
        const Duration(days: 2, hours: 2, minutes: 15),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_2_5',
      chatId: '2',
      senderId: 'current_user',
      content:
          'That\'s such a smart approach! I love how you\'re adapting your environment to work with your condition rather than against it.',
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 2)),
      isRead: true,
    ),
    Message(
      id: 'msg_2_6',
      chatId: '2',
      senderId: 'chat_user_2',
      content:
          'Exactly! It\'s all about working smarter, not harder. Would you like to connect with other parents in our community who have similar experiences?',
      timestamp: DateTime.now().subtract(
        const Duration(days: 2, hours: 1, minutes: 45),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_2_7',
      chatId: '2',
      senderId: 'current_user',
      content:
          'That would be incredibly helpful! I\'m not a parent yet, but I\'m thinking about it and have concerns about how my condition might affect pregnancy and parenting.',
      timestamp: DateTime.now().subtract(
        const Duration(days: 2, hours: 1, minutes: 30),
      ),
      isRead: true,
    ),
    Message(
      id: 'msg_2_8',
      chatId: '2',
      senderId: 'chat_user_2',
      content: 'Hello',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
  ];

  static final List<Message> danielChatMessages = [
    // No messages yet - this chat hasn't started
  ];

  // Helper method to get messages for a specific chat
  static List<Message> getMessagesForChat(String chatId) {
    switch (chatId) {
      case '1':
        return priyaChatMessages;
      case '2':
        return emilyChatMessages;
      case '3':
        return danielChatMessages;
      default:
        return [];
    }
  }

  // Helper method to get the latest message for a chat
  static Message? getLatestMessage(String chatId) {
    final messages = getMessagesForChat(chatId);
    if (messages.isEmpty) return null;

    messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return messages.first;
  }

  // Helper method to get unread message count for a chat
  static int getUnreadCount(String chatId) {
    final messages = getMessagesForChat(chatId);
    return messages
        .where((msg) => !msg.isRead && msg.senderId != 'current_user')
        .length;
  }

  // Helper method to format timestamp for display
  static String formatMessageTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else {
        return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
      }
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  // Helper method to format time for message bubbles
  static String formatBubbleTime(DateTime timestamp) {
    final hour = timestamp.hour;
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

    return '$displayHour:$minute $period';
  }
}
