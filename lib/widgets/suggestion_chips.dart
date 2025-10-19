import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class SuggestionChips extends StatelessWidget {
  const SuggestionChips({super.key});

  @override
  Widget build(BuildContext context) {
    final suggestions = [
      'No energy',
      'Headache',
      'Can\'t sleep',
      'Health check-in',
      'Other',
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: suggestions.map((suggestion) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppTheme.lightGray.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            suggestion,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.darkGray,
            ),
          ),
        );
      }).toList(),
    );
  }
}
