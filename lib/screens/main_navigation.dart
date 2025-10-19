import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_bottom_nav.dart';
import 'today_screen.dart';
import 'peers_screen.dart';
import 'chat_screen.dart';
import 'feed_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FeedScreen(),
    const PeersScreen(),
    const ChatScreen(),
    const TodayScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB action - could be create post, new chat, etc.
        },
        backgroundColor: AppTheme.primaryBlue,
        child: const Icon(Icons.add, color: AppTheme.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
