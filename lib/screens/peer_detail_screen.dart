import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/back_navigation_app_bar.dart';
import '../models/peer.dart';
import '../widgets/custom_scaffold.dart';

class PeerDetailScreen extends StatelessWidget {
  final PeerMatchingCandidate matchingCandidate;

  const PeerDetailScreen({super.key, required this.matchingCandidate});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const BackNavigationAppBar(title: 'Peers'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Main profile card
              Container(
                padding: const EdgeInsets.all(24),
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
                    // Profile picture and basic info
                    Row(
                      children: [
                        // Large profile picture
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.textMediumBlue,
                          ),
                          child: matchingCandidate.user.avatar != null &&
                                  matchingCandidate.user.avatar!.isNotEmpty
                              ? ClipOval(
                                  child: Image.network(
                                    matchingCandidate.user.avatar!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const SizedBox(
                                        width: 100,
                                        height: 100,
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
                                        size: 40,
                                      );
                                    },
                                  ),
                                )
                              : const Icon(
                                  Icons.person,
                                  color: AppTheme.white,
                                  size: 40,
                                ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                matchingCandidate.user.name,
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textDarkGray,
                                ),
                              ),
                              const SizedBox(height: 8),
                              if (matchingCandidate.user.location != null && matchingCandidate.user.location!.isNotEmpty)
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 16,
                                      color: AppTheme.orange,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      matchingCandidate.user.location!,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        color: AppTheme.textDarkGray,
                                      ),
                                    ),
                                  ],
                                ),
                              if (matchingCandidate.user.organization != null && matchingCandidate.user.organization!.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.business,
                                      size: 16,
                                      color: AppTheme.orange,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      matchingCandidate.user.organization!,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        color: AppTheme.textDarkGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              const SizedBox(height: 8),
                              Text(
                                'Member since ${matchingCandidate.user.memberSince}',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppTheme.textLightGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Condition tag
                        if (matchingCandidate.user.condition != null && matchingCandidate.user.condition!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppTheme.yellowTag, width: 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              matchingCandidate.user.condition!,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppTheme.yellowTag,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Bio section
                    if (matchingCandidate.user.bio != null && matchingCandidate.user.bio!.isNotEmpty) ...[
                      Text(
                        'About',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDarkGray,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        matchingCandidate.user.bio!,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppTheme.textDarkGray,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                    // Interests section
                    if (matchingCandidate.user.interests != null && matchingCandidate.user.interests!.isNotEmpty) ...[
                      Text(
                        'Interests',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textDarkGray,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: matchingCandidate.user.interests!.map((interest) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.lightBlueBackground,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              interest,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: AppTheme.textDarkGray,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                    ],
                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                // TODO: Implement connect functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Connect request sent!'),
                                    backgroundColor: AppTheme.primaryBlue,
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [AppTheme.blueGradientStart, AppTheme.blueGradientEnd],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.link, size: 20, color: AppTheme.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Connect',
                                      style: GoogleFonts.inter(
                                        color: AppTheme.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                // TODO: Implement chat functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Starting chat...'),
                                    backgroundColor: AppTheme.primaryBlue,
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppTheme.primaryBlue, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.chat_bubble_outline, size: 20, color: AppTheme.primaryBlue),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Chat',
                                      style: GoogleFonts.inter(
                                        color: AppTheme.primaryBlue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
