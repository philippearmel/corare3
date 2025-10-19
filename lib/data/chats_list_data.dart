import '../models/user.dart';
import '../models/chat.dart';

class ChatsListData {
  // Chats have their own user definitions
  static final User _priyaNair = User(
    id: 'chat_user_1',
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

  static final User _emilyWalker = User(
    id: 'chat_user_2',
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

  static final User _danielMuller = User(
    id: 'chat_user_3',
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
  );

  static final List<Chat> chats = [
    Chat(
      id: '1',
      user: _priyaNair,
      lastMessage: 'Hji',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 4)),
      isUnread: false,
    ),
    Chat(
      id: '2',
      user: _emilyWalker,
      lastMessage: 'Hello',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
      isUnread: false,
    ),
    Chat(
      id: '3',
      user: _danielMuller,
      lastMessage: null,
      lastMessageTime: null,
      isUnread: false,
    ),
  ];
}
