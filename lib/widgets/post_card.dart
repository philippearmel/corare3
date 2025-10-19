import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/feed.dart';
import '../screens/post_detail_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PostDetailScreen(post: post)),
        );
      },
      child: Container(
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
            // Author info and post type
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
                        post.author.name,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkGray,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: AppTheme.mediumBlue,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            post.author.location ?? '',
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
                            post.author.organization ?? '',
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
                _buildPostTypeTag(post.category),
              ],
            ),
            const SizedBox(height: 16),
            // Post title
            Text(
              post.title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkGray,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            // Post content
            Text(
              post.content,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppTheme.darkGray,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            // Engagement metrics
            Row(
              children: [
                if (post.likeCount > 0) ...[
                  const Icon(
                    Icons.favorite_border,
                    size: 18,
                    color: AppTheme.mediumBlue,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${post.likeCount}',
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
                  '${post.commentCount}',
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
    );
  }

  Widget _buildPostTypeTag(String category) {
    Color backgroundColor;
    String label;

    switch (category.toLowerCase()) {
      case 'discussion':
        backgroundColor = AppTheme.yellowTag;
        label = 'Discussion';
        break;
      case 'question':
        backgroundColor = const Color(0xFFE0E7FF);
        label = 'Question';
        break;
      case 'advice':
        backgroundColor = const Color(0xFFD1FAE5);
        label = 'Advice';
        break;
      case 'announcement':
        backgroundColor = const Color(0xFFFEF3C7);
        label = 'Announcement';
        break;
      default:
        backgroundColor = AppTheme.yellowTag;
        label = 'Discussion';
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
