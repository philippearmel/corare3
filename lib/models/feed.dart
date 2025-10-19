import 'user.dart';

class Comment {
  final String id;
  final User author;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
  });
}

class Post {
  final String id;
  final User author;
  final String title;
  final String content;
  final String category;
  final DateTime createdAt;
  int commentCount;
  final String? group;
  int likeCount;
  bool isLiked;

  Post({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt,
    this.commentCount = 0,
    this.group,
    this.likeCount = 0,
    this.isLiked = false,
  });
}
