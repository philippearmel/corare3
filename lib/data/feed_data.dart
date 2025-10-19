import '../models/user.dart';
import '../models/feed.dart';

class FeedData {
  // Feed has its own user definitions embedded in posts and comments
  static final User _emilyWalker = User(
    id: 'feed_user_1',
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
  );

  static final User _priyaNair = User(
    id: 'feed_user_2',
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
  );

  static final User _thomasBauer = User(
    id: 'feed_user_3',
    name: 'Thomas Bauer',
    location: 'london',
    memberSince: '1 week',
    isOnline: true,
    avatar:
        "https://img.freepik.com/free-photo/handsome-young-man-white-t-shirt_273609-7048.jpg",
    interests: ['⚽ Sports', '💻 Technology', '🎵 Music'],
  );

  static final User _marcelSupa = User(
    id: 'feed_user_4',
    name: 'Marcel Supa',
    location: 'paris',
    memberSince: '2 weeks',
    isOnline: false,
    interests: ['🎵 Music', '🎨 Art'],
  );

  static List<Post> posts = [
    Post(
      id: '1',
      author: _emilyWalker,
      title:
          'After keeping a food diary for 2 months, I discovered that dairy and eggs trigger my eczema. Within',
      content:
          'After keeping a food diary for 2 months, I discovered that dairy and eggs trigger my eczema. Within 24 hours of eating ice cream or cheese, I get itchy patches on my neck and behind my knees. Since cutting these out, my skin has been much clearer. Has anyone else had similar experiences with food triggers?',
      category: 'Discussion',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      commentCount: 2,
      likeCount: 12,
    ),
    Post(
      id: '2',
      author: _emilyWalker,
      title:
          'Every winter, like clockwork, my psoriasis gets worse. The dry air and cold weather make my scalp an',
      content:
          'Every winter, like clockwork, my psoriasis gets worse. The dry air and cold weather make my scalp and knees flare up with thick, silvery scales. This year I\'m being proactive - using a humidifier in my bedroom, applying coconut oil after showers, and switching to fragrance-free products. What are your winter psoriasis management strategies?',
      category: 'Discussion',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      commentCount: 1,
      likeCount: 8,
    ),
    Post(
      id: '3',
      author: _priyaNair,
      title:
          'I\'ve been dealing with eczema for 5 years now, and I\'ve finally figured out my biggest trigger: stre',
      content:
          'I\'ve been dealing with eczema for 5 years now, and I\'ve finally figured out my biggest trigger: stress. When work gets overwhelming, my skin flares up within hours. I\'ve started meditation and regular exercise, which has helped significantly.',
      category: 'Discussion',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      commentCount: 0,
      likeCount: 5,
    ),
  ];

  // Comments storage - Map of postId to list of comments
  static final Map<String, List<Comment>> postComments = {
    '1': [
      Comment(
        id: 'c1',
        author: _priyaNair,
        content: 'I had the same experience! Cutting out gluten helped me too.',
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      ),
      Comment(
        id: 'c2',
        author: _thomasBauer,
        content:
            'Thanks for sharing this. I\'m going to try keeping a food diary.',
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
    ],
    '2': [
      Comment(
        id: 'c3',
        author: _marcelSupa,
        content: 'Winter is tough! I use a humidifier too and it really helps.',
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      ),
    ],
  };
}
