enum MessageType { text, image, system }

class ChatMessage {
  final String id;
  final String chatId;
  final String senderId;
  final String senderName;
  final String? content;
  final String? imageUrl;
  final MessageType type;
  final DateTime timestamp;
  final bool isFromUser;

  const ChatMessage({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.senderName,
    this.content,
    this.imageUrl,
    required this.type,
    required this.timestamp,
    required this.isFromUser,
  });
}

class Chat {
  final String id;
  final String otherUserId;
  final String otherUserName;
  final String otherUserProfileImageUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isOnline;

  const Chat({
    required this.id,
    required this.otherUserId,
    required this.otherUserName,
    required this.otherUserProfileImageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    this.isOnline = false,
  });
}
