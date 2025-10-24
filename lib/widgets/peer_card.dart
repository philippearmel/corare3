import 'package:corare/models/peer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';


class PeerCard extends StatelessWidget {
  final PeerMatchingCandidate matchingCandidate;

  const PeerCard({super.key, required this.matchingCandidate});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Profile picture with online indicator
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.mediumBlue,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppTheme.white,
                      size: 30,
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
                      matchingCandidate.user.name,
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
                          size: 14,
                          color: AppTheme.mediumBlue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          matchingCandidate.user.location ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.mediumBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.business,
                          size: 14,
                          color: AppTheme.mediumBlue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          matchingCandidate.user.organization ?? '',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.mediumBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Member since ${matchingCandidate.user.memberSince}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppTheme.lightGray,
                      ),
                    ),
                  ],
                ),
              ),
              // Condition tag
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.yellowTag,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  matchingCandidate.user.condition ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: AppTheme.darkGray,
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
              color: AppTheme.darkGray,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Interests
          if (matchingCandidate.user.interests != null && matchingCandidate.user.interests!.isNotEmpty) ...[
            Text(
              'Interests',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkGray,
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
                      color: AppTheme.darkGray,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
          // Action buttons
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.link, size: 18),
                label: const Text('Connect'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  foregroundColor: AppTheme.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              const SizedBox(width: 12),
              
            ],
          ),
        ],
      ),
    );
  }
}
