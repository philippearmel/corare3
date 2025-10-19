class User {
  final String id;
  final String name;
  final String location;
  final String organization;
  final String memberSince;
  final String condition;
  final String bio;
  final List<String> interests;
  final String profileImageUrl;
  final bool isOnline;

  const User({
    required this.id,
    required this.name,
    required this.location,
    required this.organization,
    required this.memberSince,
    required this.condition,
    required this.bio,
    required this.interests,
    required this.profileImageUrl,
    this.isOnline = false,
  });
}

class ChatUser {
  final String id;
  final String name;
  final String lastMessage;
  final String timeAgo;
  final int unreadCount;
  final String profileImageUrl;
  final bool isOnline;

  const ChatUser({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.timeAgo,
    required this.unreadCount,
    required this.profileImageUrl,
    this.isOnline = false,
  });
}
