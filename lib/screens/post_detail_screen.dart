import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_app_bar.dart';
import '../models/feed.dart';
import '../data/feed_data.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/post_card.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Use comments data from FeedData
    final comments = FeedData.postComments[post.id] ?? [];

    return CustomScaffold(
      appBar: const NavigationAppBar(title: 'Posts'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Post content using PostCard widget
            Padding(
              padding: const EdgeInsets.all(20),
              child: PostCard(post: post),
            ),
            // Comments section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
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
            const SizedBox(height: 20),
            // Add comment input
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment',
                        hintStyle: GoogleFonts.inter(
                          color: AppTheme.mediumBlue,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
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
            const SizedBox(height: 20),
          ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }

}
