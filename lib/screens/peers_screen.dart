import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/peer_card.dart';
import '../models/user.dart';
import '../widgets/custom_scaffold.dart';

class PeersScreen extends StatelessWidget {
  const PeersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - in a real app, this would come from a service
    final peers = [
      const User(
        id: '1',
        name: 'Emily Walker',
        location: 'Liverpool',
        organization: 'Acmee Org',
        memberSince: '1 week',
        condition: 'Brugada syndrome',
        bio:
            'First-time mom to baby Noah (3 months); learning gentle handling, bath time setups, and quick diaper change techniques, seeking other newborn tips.',
        interests: [
          'Parenting',
          'Health and fitness',
          'Reading',
          'Photography',
          'Hiking',
        ],
        profileImageUrl: '',
        isOnline: true,
      ),
      const User(
        id: '2',
        name: 'Priya Nair',
        location: 'Nottingham',
        organization: 'United',
        memberSince: '1 month',
        condition: 'Epidermolysis bullosa',
        bio:
            'Amateur photographer who plans outdoor shoots around shade and wind - happy to trade sun/heat strategies and travel packing lists.',
        interests: ['Photography', 'Travel', 'Health'],
        profileImageUrl: '',
        isOnline: true,
      ),
      const User(
        id: '3',
        name: 'Thomas Bauer',
        location: 'London',
        organization: 'FastAid',
        memberSince: '3 weeks',
        condition: 'Brugada syndrome',
        bio:
            'Home gardener matching plants to moods and seasons, open to swapping propagation wins and compost fails. Also a cyclist who picks routes by pastry quality at halfway stops.',
        interests: ['Gardening', 'Cycling', 'Cooking'],
        profileImageUrl: '',
        isOnline: true,
      ),
    ];

    return CustomScaffold(
      appBar: const AppHeader(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: peers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PeerCard(user: peers[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
