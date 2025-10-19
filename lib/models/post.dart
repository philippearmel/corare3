enum PostType { discussion, question, advice, announcement }

class Post {
  final String id;
  final String authorId;
  final String authorName;
  final String authorLocation;
  final String authorOrganization;
  final String authorProfileImageUrl;
  final PostType type;
  final String title;
  final String content;
  final int likes;
  final int comments;
  final DateTime createdAt;

  const Post({
    required this.id,
    required this.authorId,
    required this.authorName,
    required this.authorLocation,
    required this.authorOrganization,
    required this.authorProfileImageUrl,
    required this.type,
    required this.title,
    required this.content,
    required this.likes,
    required this.comments,
    required this.createdAt,
  });
}

class Comment {
  final String id;
  final String postId;
  final String authorId;
  final String authorName;
  final String authorProfileImageUrl;
  final String content;
  final DateTime createdAt;

  const Comment({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.authorName,
    required this.authorProfileImageUrl,
    required this.content,
    required this.createdAt,
  });
}
