import '../models/user.dart';
import '../models/peer.dart';

/// Peers are matching candidates shown on the peers screen
class PeersData {
  // Peers are matching candidates with user info, connection status, and matching scores
  static final List<PeerMatchingCandidate> peers = [
    PeerMatchingCandidate(
      user: User(
        id: '1',
        name: 'Emily Walker',
        location: 'liverpool',
        organization: 'Acmee Org',
        bio:
            'First-time mom to baby Noah (3 months); learning gentle handling, bath time setups, and quick diaper-change techniques, seeking other newborn tips.',
        condition: 'Brugada Syndrome',
        diagnosedSince: '2018',
        memberSince: '1 week',
        avatar:
            'https://img.freepik.com/free-photo/indoor-portrait-beautiful-freckled-woman-with-dark-curly-hair-wears-fashionable-striped-shirt-rejoices-day-off-isolated-white-wall-curly-satisfied-woman-stands-indoor-alone_273609-15765.jpg',
        interests: [
          '👶 Parenting',
          '🩺 Health & Wellness',
          '📸 Photography',
          '📚 Reading',
        ],
      ),
      wantsToConnect: true,
      matchingScore: 85,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '2',
        name: 'Priya Nair',
        location: 'nottingham',
        bio:
            'Amateur photographer who plans outdoor shoots around shade and wind -happy to trade sun/heat strategies and travel packing lists.',
        condition: 'Epidermolysis bullosa',
        diagnosedSince: '2020',
        memberSince: '1 week',
        avatar:
            "https://img.freepik.com/free-photo/good-looking-caucasian-female-with-blonde-straight-hair-wearing-glasses-denim-shirt-smiles-happily-has-good-mood-after-successful-day-university-glad-pleased-pose_176420-13174.jpg",
        interests: ['📸 Photography', '✈️ Travel', '🌿 Nature', '🎨 Art'],
      ),
      wantsToConnect: true,
      matchingScore: 72,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '3',
        name: 'Thomas Bauer',
        location: 'london',
        memberSince: '1 week',
        avatar:
            "https://img.freepik.com/free-photo/handsome-young-man-white-t-shirt_273609-7048.jpg",
        interests: ['⚽ Sports', '💻 Technology', '🎵 Music'],
      ),
      wantsToConnect: false,
      matchingScore: 45,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '4',
        name: 'Daniel Müller',
        bio:
            'Living with eczema and psoriasis for 5+ years. Sharing my journey and tips for managing these conditions.',
        memberSince: '1 week',
        avatar:
            'https://img.freepik.com/free-photo/business-man-by-skyscraper_1303-13655.jpg',
        interests: [
          '🩺 Health & Wellness',
          '🍳 Cooking',
          '💪 Fitness',
          '🧘 Meditation',
        ],
      ),
      wantsToConnect: true,
      matchingScore: 68,
    ),
    PeerMatchingCandidate(
      user: User(id: '5', name: 'Anne Sofia', memberSince: 'now'),
      wantsToConnect: false,
      matchingScore: 30,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '6',
        name: 'Marcus Johnson',
        location: 'manchester',
        organization: 'Health Support Network',
        bio: 'Living with diabetes for 8 years. Passionate about healthy cooking and exercise routines that work with my condition.',
        condition: 'Type 2 Diabetes',
        diagnosedSince: '2016',
        memberSince: '2 weeks',
        avatar: 'https://img.freepik.com/free-photo/portrait-young-man-with-dark-curly-hair_176420-18776.jpg',
        interests: ['🍳 Cooking', '💪 Fitness', '🏃 Running', '📚 Health Education'],
      ),
      wantsToConnect: true,
      matchingScore: 78,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '7',
        name: 'Sarah Chen',
        location: 'birmingham',
        bio: 'Artist and advocate for mental health awareness. Sharing my journey with anxiety and depression through creative expression.',
        condition: 'Anxiety & Depression',
        diagnosedSince: '2019',
        memberSince: '3 weeks',
        avatar: 'https://img.freepik.com/free-photo/beautiful-woman-with-long-hair_176420-18825.jpg',
        interests: ['🎨 Art', '✍️ Writing', '🧘 Meditation', '🌸 Nature'],
      ),
      wantsToConnect: true,
      matchingScore: 82,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '8',
        name: 'James Wilson',
        location: 'glasgow',
        organization: 'Scottish Health Alliance',
        bio: 'Former athlete dealing with chronic pain. Focused on adaptive sports and maintaining an active lifestyle.',
        condition: 'Chronic Pain Syndrome',
        diagnosedSince: '2021',
        memberSince: '1 month',
        avatar: 'https://img.freepik.com/free-photo/confident-handsome-man-posing_176420-18826.jpg',
        interests: ['⚽ Sports', '🏋️ Weight Training', '🎯 Archery', '📖 Reading'],
      ),
      wantsToConnect: false,
      matchingScore: 55,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '9',
        name: 'Aisha Patel',
        location: 'leeds',
        bio: 'Mother of two managing rheumatoid arthritis. Sharing tips on parenting with chronic illness and finding balance.',
        condition: 'Rheumatoid Arthritis',
        diagnosedSince: '2018',
        memberSince: '2 months',
        avatar: 'https://img.freepik.com/free-photo/beautiful-woman-with-warm-smile_176420-18827.jpg',
        interests: ['👶 Parenting', '🧘 Yoga', '🍳 Healthy Cooking', '📚 Child Development'],
      ),
      wantsToConnect: true,
      matchingScore: 90,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '10',
        name: 'Robert Taylor',
        location: 'edinburgh',
        bio: 'Tech professional with multiple sclerosis. Interested in accessibility in technology and adaptive solutions.',
        condition: 'Multiple Sclerosis',
        diagnosedSince: '2020',
        memberSince: '1 month',
        avatar: 'https://img.freepik.com/free-photo/man-with-beard-smiling_176420-18828.jpg',
        interests: ['💻 Technology', '♿ Accessibility', '🎮 Gaming', '🔧 DIY Projects'],
      ),
      wantsToConnect: true,
      matchingScore: 65,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '11',
        name: 'Lisa Martinez',
        location: 'cardiff',
        organization: 'Welsh Health Foundation',
        bio: 'Nurse and patient advocate with lupus. Passionate about patient education and healthcare system improvements.',
        condition: 'Lupus',
        diagnosedSince: '2017',
        memberSince: '3 months',
        avatar: 'https://img.freepik.com/free-photo/confident-professional-woman_176420-18829.jpg',
        interests: ['🩺 Healthcare', '📚 Education', '✈️ Travel', '🎵 Music'],
      ),
      wantsToConnect: true,
      matchingScore: 88,
    ),
    PeerMatchingCandidate(
      user: User(
        id: '12',
        name: 'David Kim',
        location: 'belfast',
        bio: 'Student with Crohn\'s disease. Navigating university life while managing my condition and advocating for campus accessibility.',
        condition: 'Crohn\'s Disease',
        diagnosedSince: '2022',
        memberSince: '2 weeks',
        avatar: 'https://img.freepik.com/free-photo/young-student-with-glasses_176420-18830.jpg',
        interests: ['📚 Study Groups', '🎓 University Life', '🍽️ Nutrition', '🎮 Gaming'],
      ),
      wantsToConnect: false,
      matchingScore: 42,
    ),
  ];
}
