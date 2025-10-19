import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/navigation_app_bar.dart';
import '../models/post.dart';
import '../widgets/custom_scaffold.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Sample comments data
    final comments = [
      Comment(
        id: '1',
        postId: post.id,
        authorId: '2',
        authorName: 'Priya Nair',
        authorProfileImageUrl: '',
        content: 'I had the same experience! Cutting out gluten helped me too.',
        createdAt: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Comment(
        id: '2',
        postId: post.id,
        authorId: '3',
        authorName: 'Thomas Bauer',
        authorProfileImageUrl: '',
        content:
            'Thanks for sharing this. I\'m going to try keeping a food diary.',
        createdAt: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ];

    return CustomScaffold(
      appBar: const NavigationAppBar(title: 'Posts'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Post content
            Container(
              margin: const EdgeInsets.all(20),
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
                  // Author info
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.mediumBlue,
                        ),
                        child: const Icon(
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
                              post.authorName,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkGray,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: AppTheme.mediumBlue,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  post.authorLocation,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppTheme.mediumBlue,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.business,
                                  size: 12,
                                  color: AppTheme.mediumBlue,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  post.authorOrganization,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppTheme.mediumBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildPostTypeTag(post.type),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Post title
                  Text(
                    post.title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkGray,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Post content
                  Text(
                    post.content,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.darkGray,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Engagement metrics
                  Row(
                    children: [
                      if (post.likes > 0) ...[
                        const Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: AppTheme.mediumBlue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${post.likes}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppTheme.mediumBlue,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                      const Icon(
                        Icons.chat_bubble_outline,
                        size: 18,
                        color: AppTheme.mediumBlue,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${post.comments}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.mediumBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.mediumBlue,
            ),
            child: const Icon(Icons.person, color: AppTheme.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.authorName,
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

  Widget _buildPostTypeTag(PostType type) {
    Color backgroundColor;
    String label;

    switch (type) {
      case PostType.discussion:
        backgroundColor = AppTheme.yellowTag;
        label = 'Discussion';
        break;
      case PostType.question:
        backgroundColor = const Color(0xFFE0E7FF);
        label = 'Question';
        break;
      case PostType.advice:
        backgroundColor = const Color(0xFFD1FAE5);
        label = 'Advice';
        break;
      case PostType.announcement:
        backgroundColor = const Color(0xFFFEF3C7);
        label = 'Announcement';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppTheme.darkGray,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
