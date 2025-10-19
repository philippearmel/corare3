import 'user.dart';

enum MessageType { text, image, voice, file }

class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final bool isRead;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.type = MessageType.text,
    this.isRead = false,
  });
}

class Chat {
  final String id;
  final User user;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final bool isUnread;

  Chat({
    required this.id,
    required this.user,
    this.lastMessage,
    this.lastMessageTime,
    this.isUnread = false,
  });
}
