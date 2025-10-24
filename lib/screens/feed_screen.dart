import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/post_card.dart';
import '../data/feed_data.dart';
import '../widgets/custom_scaffold.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize post states for persistent like functionality
    FeedData.initializePostStates();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh the screen when returning from other screens
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Use data from lib/data instead of hardcoded data
    final posts = FeedData.posts;

    return CustomScaffold(
      appBar: const AppHeader(),
      body: Column(
        children: [
          // Tab selector hidden for now
          /*
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                _buildTab(0, 'For you'),
                const SizedBox(width: 16),
                _buildTab(1, 'Popular'),
              ],
            ),
          ), */
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PostCard(post: posts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
