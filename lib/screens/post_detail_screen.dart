import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_app_bar.dart';
import '../models/feed.dart';
import '../data/feed_data.dart';
import '../data/user_data.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/post_card.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    final commentText = _commentController.text.trim();
    if (commentText.isEmpty) return;

    FeedData.addComment(post.id, commentText, UserData.currentUser);
    _commentController.clear();
    setState(() {
      // Update the post's comment count
      post.commentCount = FeedData.getCommentCount(post.id);
    });
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use comments data from FeedData
    final comments = FeedData.postComments[post.id] ?? [];

    return CustomScaffold(
      appBar: const NavigationAppBar(title: 'Today'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Post content using PostCard widget (without navigation)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: PostCard(post: post, showFullContent: true, disableNavigation: true),
                ),
                // Horizontal divider
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: Colors.grey.withValues(alpha: 0.2),
                ),
                // Comments section
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comments (${comments.length})',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...comments.map((comment) => _buildComment(comment)),
                    ],
                  ),
                ),
                // Add comment input
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.3),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Add a comment',
                              hintStyle: GoogleFonts.inter(
                                color: AppTheme.mediumBlue,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            onSubmitted: (_) => _addComment(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                               AppTheme.blueGradientStart,
                               AppTheme.blueGradientEnd,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: _addComment,
                            icon: const Icon(
                              Icons.send,
                              color: AppTheme.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.mediumBlue,
            ),
            child: comment.author.avatar != null && comment.author.avatar!.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      comment.author.avatar!,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppTheme.white,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          color: AppTheme.white,
                          size: 24,
                        );
                      },
                    ),
                  )
                : const Icon(
                    Icons.person,
                    color: AppTheme.white,
                    size: 24,
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.author.name,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.darkGray,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getTimeAgo(comment.createdAt),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.lightGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
