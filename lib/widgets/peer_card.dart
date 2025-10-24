import 'package:corare/models/peer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../screens/peer_detail_screen.dart';


class PeerCard extends StatelessWidget {
  final PeerMatchingCandidate matchingCandidate;

  const PeerCard({super.key, required this.matchingCandidate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PeerDetailScreen(matchingCandidate: matchingCandidate),
          ),
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
          Row(
            children: [
              // Profile picture
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.textMediumBlue,
                ),
                child: matchingCandidate.user.avatar != null &&
                        matchingCandidate.user.avatar!.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          matchingCandidate.user.avatar!,
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
                  children: [
                    Text(
                      matchingCandidate.user.name,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDarkGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    if (matchingCandidate.user.location != null && matchingCandidate.user.location!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: AppTheme.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            matchingCandidate.user.location!,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.textDarkGray,
                            ),
                          ),
                        ],
                      ),
                    if (matchingCandidate.user.location != null && matchingCandidate.user.location!.isNotEmpty)
                      const SizedBox(height: 2),
                    if (matchingCandidate.user.organization != null && matchingCandidate.user.organization!.isNotEmpty)
                      Row(
                        children: [
                          const Icon(
                            Icons.business,
                            size: 12,
                            color: AppTheme.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            matchingCandidate.user.organization!,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppTheme.textDarkGray,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              // Condition tag
              if (matchingCandidate.user.condition != null && matchingCandidate.user.condition!.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.yellowTag, width: 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    matchingCandidate.user.condition!,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.yellowTag,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            matchingCandidate.user.bio ?? '',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textDarkGray,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          // Interests
          if (matchingCandidate.user.interests != null && matchingCandidate.user.interests!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Interests',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDarkGray,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: matchingCandidate.user.interests!.map((interest) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.lightBlueBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    interest,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppTheme.textDarkGray,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
          // Action buttons
          const SizedBox(height: 16),
          Row(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.link, size: 18, color: AppTheme.white),
                        const SizedBox(width: 8),
                        Text(
                          matchingCandidate.wantsToConnect ? 'Accept' : 'Connect',
                          style: GoogleFonts.inter(
                            color: AppTheme.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
            ],
          ),
          ],
        ),
      ),
    );
  }
}
