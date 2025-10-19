import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/peer_card.dart';
import '../data/peers_data.dart';
import '../widgets/custom_scaffold.dart';

class PeersScreen extends StatelessWidget {
  const PeersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use data from lib/data instead of hardcoded data
    final peers = PeersData.peers;

    return CustomScaffold(
      appBar: const AppHeader(),
      body: Column(
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
    );
  }
}
