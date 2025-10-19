import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/post_card.dart';
import '../models/post.dart';

class AssistScreen extends StatefulWidget {
  const AssistScreen({super.key});

  @override
  State<AssistScreen> createState() => _AssistScreenState();
}

class _AssistScreenState extends State<AssistScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Sample data - in a real app, this would come from a service
    final posts = [
      Post(
        id: '1',
        authorId: '1',
        authorName: 'Emily Walker',
        authorLocation: 'Liverpool',
        authorOrganization: 'Acmee Org',
        authorProfileImageUrl: '',
        type: PostType.discussion,
        title:
            'After keeping a food diary for two months, I discovered that dairy and eggs trigger my eczema.',
        content:
            'I discovered tha dairy and eggs trigger my eczema. Within 24 hours of eating ice cream or cheese, I get itchy patches on my neck and behind my knees. Since cutting these out, my skin has been much clearer. Has anyone else had similar experiences with food triggers?',
        likes: 30,
        comments: 2,
        createdAt: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Post(
        id: '2',
        authorId: '2',
        authorName: 'Daniel Smith',
        authorLocation: 'Austin',
        authorOrganization: 'Ecms Co',
        authorProfileImageUrl: '',
        type: PostType.announcement,
        title:
            'I\'ve been dealing with eczema for 5 years now and I\'ve finally figured out my biggest trigger, stress and poor diet.',
        content:
            'I\'ve been dealing with eczema for 5 years now and I\'ve finally figured out my biggest trigger, stress and poor diet. When I lower my stress levels and improve my diet my synthoms are almost gone and I can finally...',
        likes: 0,
        comments: 10,
        createdAt: DateTime.now().subtract(Duration(hours: 4)),
      ),
      Post(
        id: '3',
        authorId: '3',
        authorName: 'Kunal Batra',
        authorLocation: 'London',
        authorOrganization: 'Enic Org',
        authorProfileImageUrl: '',
        type: PostType.question,
        title:
            'I noticed that in winter my psoriasis gets worse. Is anyone experiencing the same?',
        content:
            'Every winter, like clockwork, my psoriasis gets worse. The dry air and cold weather make my scalp flare up with thick, silvery scales. This year I\'m being proactive - using a humidifier in my bedroom, applying coconut oil after...',
        likes: 0,
        comments: 10,
        createdAt: DateTime.now().subtract(Duration(hours: 6)),
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.lightBlueBackground,
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            // Tab selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  _buildTab(0, 'For you'),
                  const SizedBox(width: 16),
                  _buildTab(1, 'Popular'),
                ],
              ),
            ),
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
      ),
    );
  }

  Widget _buildTab(int index, String label) {
    final isSelected = _selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : AppTheme.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppTheme.white : AppTheme.darkGray,
          ),
        ),
      ),
    );
  }
}
