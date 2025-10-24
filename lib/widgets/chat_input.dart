import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.attach_file, color: AppTheme.textMediumBlue),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.lightBlueBackground,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Ask a question',
                  hintStyle: TextStyle(
                    color: AppTheme.textMediumBlue,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic, color: AppTheme.textMediumBlue),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            decoration: const BoxDecoration(
              color: AppTheme.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send, color: AppTheme.white),
            ),
          ),
        ],
      ),
    );
  }
}
