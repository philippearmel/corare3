import 'user.dart';

class PeerMatchingCandidate {
  final User user;
  final bool wantsToConnect;
  final int matchingScore;

  PeerMatchingCandidate({
    required this.user,
    required this.wantsToConnect,
    required this.matchingScore,
  });

  @override
  String toString() {
    return 'PeerMatchingCandidate(user: ${user.name}, wantsToConnect: $wantsToConnect, matchingScore: $matchingScore)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PeerMatchingCandidate &&
        other.user.id == user.id &&
        other.wantsToConnect == wantsToConnect &&
        other.matchingScore == matchingScore;
  }

  @override
  int get hashCode {
    return user.id.hashCode ^ wantsToConnect.hashCode ^ matchingScore.hashCode;
  }
}
