import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/feed.dart';
import '../screens/post_detail_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final bool showFullContent;
  final bool disableNavigation;

  const PostCard({
    super.key, 
    required this.post,
    this.showFullContent = false,
    this.disableNavigation = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      padding: disableNavigation ? EdgeInsets.zero : const EdgeInsets.all(20),
      decoration: disableNavigation ? null : BoxDecoration(
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
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.mediumBlue,
                ),
                child:
                    post.author.avatar != null &&
                        post.author.avatar!.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          post.author.avatar!,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const SizedBox(
                              width: 70,
                              height: 70,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    if (post.author.location != null && post.author.location!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: Color(0xFFFFB700),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            post.author.location!,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.darkGray,
                            ),
                          ),
                        ],
                      ),
                    if (post.author.location != null && post.author.location!.isNotEmpty)
                      const SizedBox(height: 2),
                    if (post.author.organization != null && post.author.organization!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(
                            Icons.business,
                            size: 12,
                            color: Color(0xFFFFB700),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            post.author.organization!,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.darkGray,
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
            maxLines: showFullContent ? null : 3,
            overflow: showFullContent ? null : TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          // Engagement metrics
          Row(
            children: [
              if (post.likeCount > 0) ...[
                const Icon(
                  Icons.favorite,
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
    );

    // Wrap with GestureDetector only if navigation is not disabled
    if (disableNavigation) {
      return cardContent;
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PostDetailScreen(post: post)),
          );
        },
        child: cardContent,
      );
    }
  }

  Widget _buildPostTypeTag(String category) {
    Color borderColor;
    String label;

    switch (category.toLowerCase()) {
      case 'discussion':
        borderColor = const Color(0xFFFFB700);
        label = 'Discussion';
        break;
      case 'question':
        borderColor = const Color(0xFF8B5CF6);
        label = 'Question';
        break;
      case 'advice':
        borderColor = const Color(0xFF10B981);
        label = 'Advice';
        break;
      case 'announcement':
        borderColor = const Color(0xFF22C55E);
        label = 'Announcement';
        break;
      default:
        borderColor = const Color(0xFFFFB700);
        label = 'Discussion';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: borderColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
