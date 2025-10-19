import '../models/user.dart';

/// Peers are matching candidates shown on the peers screen
class PeersData {
  // Peers have their own user definitions
  static final List<User> peers = [
    User(
      id: '1',
      name: 'Emily Walker',
      location: 'liverpool',
      organization: 'Acmee Org',
      bio:
          'First-time mom to baby Noah (3 months); learning gentle handling, bath time setups, and quick diaper-change techniques, seeking other newborn tips.',
      condition: 'Brugada Syndrome',
      diagnosedSince: '2018',
      memberSince: '1 week',
      isOnline: true,
      avatar:
          'https://img.freepik.com/free-photo/indoor-portrait-beautiful-freckled-woman-with-dark-curly-hair-wears-fashionable-striped-shirt-rejoices-day-off-isolated-white-wall-curly-satisfied-woman-stands-indoor-alone_273609-15765.jpg',
      interests: [
        '👶 Parenting',
        '🩺 Health & Wellness',
        '📸 Photography',
        '📚 Reading',
      ],
    ),
    User(
      id: '2',
      name: 'Priya Nair',
      location: 'nottingham',
      bio:
          'Amateur photographer who plans outdoor shoots around shade and wind -happy to trade sun/heat strategies and travel packing lists.',
      condition: 'Epidermolysis bullosa',
      diagnosedSince: '2020',
      memberSince: '1 week',
      isOnline: true,
      avatar:
          "https://img.freepik.com/free-photo/good-looking-caucasian-female-with-blonde-straight-hair-wearing-glasses-denim-shirt-smiles-happily-has-good-mood-after-successful-day-university-glad-pleased-pose_176420-13174.jpg",
      interests: ['📸 Photography', '✈️ Travel', '🌿 Nature', '🎨 Art'],
    ),
    User(
      id: '3',
      name: 'Thomas Bauer',
      location: 'london',
      memberSince: '1 week',
      isOnline: true,
      avatar:
          "https://img.freepik.com/free-photo/handsome-young-man-white-t-shirt_273609-7048.jpg",
      interests: ['⚽ Sports', '💻 Technology', '🎵 Music'],
    ),
    User(
      id: '4',
      name: 'Daniel Müller',
      bio:
          'Living with eczema and psoriasis for 5+ years. Sharing my journey and tips for managing these conditions.',
      memberSince: '1 week',
      isOnline: false,
      avatar:
          'https://img.freepik.com/free-photo/business-man-by-skyscraper_1303-13655.jpg',
      interests: [
        '🩺 Health & Wellness',
        '🍳 Cooking',
        '💪 Fitness',
        '🧘 Meditation',
      ],
    ),
    User(id: '5', name: 'Anne Sofia', memberSince: 'now', isOnline: false),
  ];
}
