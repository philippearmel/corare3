import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/feed.dart';
import '../screens/post_detail_screen.dart';
import '../data/feed_data.dart';

class PostCard extends StatefulWidget {
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
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh the widget when returning from other screens
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleLike() {
    FeedData.togglePostLike(post.id);
    setState(() {
      // State will be updated through the persistent storage
    });
  }

  bool get _isLiked => FeedData.isPostLiked(post.id);
  int get _likeCount => FeedData.getPostLikeCount(post.id);
  int get _commentCount => FeedData.getCommentCount(post.id);

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
    Widget cardContent = Container(
      padding: widget.disableNavigation ? EdgeInsets.zero : const EdgeInsets.all(20),
      decoration: widget.disableNavigation ? null : BoxDecoration(
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
                            color: AppTheme.orange,
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
                            color: AppTheme.orange,
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
            maxLines: widget.showFullContent ? null : 3,
            overflow: widget.showFullContent ? null : TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          // Time ago
          Text(
            _getTimeAgo(post.createdAt),
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.lightGray,
            ),
          ),
          const SizedBox(height: 16),
          // Engagement metrics
          Row(
            children: [
              // Heart button
              GestureDetector(
                onTap: _toggleLike,
                child: Row(
                  children: [
                    Icon(
                      _isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color:  AppTheme.primaryBlue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$_likeCount',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppTheme.darkGray,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: AppTheme.primaryBlue,
              ),
              const SizedBox(width: 4),
              Text(
                '$_commentCount',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.darkGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Wrap with GestureDetector only if navigation is not disabled
    if (widget.disableNavigation) {
      return cardContent;
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PostDetailScreen(post: post)),
          ).then((_) {
            // Refresh the widget when returning from PostDetailScreen
            if (mounted) {
              setState(() {});
            }
          });
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
      case 'vent':
        borderColor = const Color(0xFFEF4444);
        label = 'Vent';
        break;
      case 'success story':
        borderColor = const Color(0xFF06B6D4);
        label = 'Success Story';
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
