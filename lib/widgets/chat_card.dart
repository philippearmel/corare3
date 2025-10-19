import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Profile picture with online indicator
          Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.mediumGray,
                ),
                child: const Icon(
                  Icons.person,
                  color: AppTheme.white,
                  size: 30,
                ),
              ),
              if (chat.isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: AppTheme.greenOnline,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.otherUserName,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  chat.lastMessage,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.mediumGray,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${chat.unreadCount} new message • ${_formatTime(chat.lastMessageTime)}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.lightGray,
                  ),
                ),
              ],
            ),
          ),
          if (chat.unreadCount > 0)
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppTheme.primaryBlue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${chat.unreadCount}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}
