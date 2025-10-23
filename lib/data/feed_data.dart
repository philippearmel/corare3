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

  static final User _sarahChen = User(
    id: 'feed_user_5',
    name: 'Sarah Chen',
    location: 'manchester',
    organization: 'Health Foundation',
    bio: 'Registered nurse with 8 years experience in dermatology. Passionate about patient education and community support.',
    condition: 'Psoriasis',
    diagnosedSince: '2015',
    memberSince: '3 months',
    isOnline: true,
    avatar: 'https://img.freepik.com/free-photo/portrait-young-woman-with-long-hair_273609-7090.jpg',
    interests: ['🩺 Healthcare', '📚 Education', '🏃‍♀️ Fitness', '☕ Coffee'],
  );

  static final User _jamesWilson = User(
    id: 'feed_user_6',
    name: 'James Wilson',
    location: 'birmingham',
    bio: 'Software developer who found relief through lifestyle changes. Love sharing practical tips with the community.',
    condition: 'Eczema',
    diagnosedSince: '2019',
    memberSince: '6 months',
    isOnline: true,
    avatar: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
    interests: ['💻 Technology', '🏃‍♂️ Running', '📖 Books', '🎮 Gaming'],
  );

  static final User _lisaRodriguez = User(
    id: 'feed_user_7',
    name: 'Lisa Rodriguez',
    location: 'glasgow',
    bio: 'Mother of two, managing my condition while raising kids. Always looking for family-friendly solutions.',
    condition: 'Atopic Dermatitis',
    diagnosedSince: '2017',
    memberSince: '1 year',
    isOnline: false,
    avatar: 'https://img.freepik.com/free-photo/beautiful-woman-portrait_273609-7091.jpg',
    interests: ['👶 Parenting', '🍳 Cooking', '🧘‍♀️ Yoga', '📚 Reading'],
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
    Post(
      id: '4',
      author: _sarahChen,
      title: 'New Research Study: Psoriasis and Mental Health Connection',
      content:
          'Exciting news! Our research team at Health Foundation has published a new study showing the significant impact of psoriasis on mental health. The study followed 500 patients over 2 years and found that 68% experienced anxiety or depression related to their condition. We\'re now developing a new support program specifically for mental health in dermatology patients. Applications open next month!',
      category: 'Announcement',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      commentCount: 8,
      likeCount: 24,
    ),
    Post(
      id: '5',
      author: _jamesWilson,
      title: 'My Top 5 Tips for Managing Eczema During Work Hours',
      content:
          'After 3 years of trial and error, here are my go-to strategies for keeping eczema under control at work:\n\n1. Keep a small humidifier at your desk\n2. Use fragrance-free hand sanitizer\n3. Apply moisturizer every 2 hours\n4. Wear breathable cotton clothing\n5. Take 5-minute breaks to stretch and relax\n\nThese small changes made a huge difference in my daily comfort!',
      category: 'Advice',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      commentCount: 12,
      likeCount: 18,
    ),
    Post(
      id: '6',
      author: _lisaRodriguez,
      title: 'Feeling Overwhelmed Today',
      content:
          'Having a really tough day. My skin is flaring up badly and I\'m trying to get my kids ready for school while dealing with the pain and itching. Sometimes it feels like no one understands how exhausting it is to manage this condition while being a parent. Just needed to vent to people who get it. 💙',
      category: 'Vent',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      commentCount: 15,
      likeCount: 22,
    ),
    Post(
      id: '7',
      author: _emilyWalker,
      title: '6 Months Clear - My Success Story!',
      content:
          'I can\'t believe I\'m writing this, but I\'ve been completely clear for 6 months now! After years of struggling with severe eczema, I finally found the right combination: gentle skincare routine, stress management, and identifying my food triggers. My confidence is back and I feel like myself again. To anyone struggling - don\'t give up hope! 💪✨',
      category: 'Success Story',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      commentCount: 25,
      likeCount: 45,
    ),
    Post(
      id: '8',
      author: _thomasBauer,
      title: 'Community Meetup - London This Saturday!',
      content:
          'Hey everyone! We\'re organizing a casual meetup this Saturday at Hyde Park (2 PM near the Serpentine). It\'s a great chance to connect in person, share experiences, and just hang out with people who understand. No pressure to talk about your condition - just come for the community! DM me if you\'re interested. ☀️',
      category: 'Announcement',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      commentCount: 7,
      likeCount: 15,
    ),
    Post(
      id: '9',
      author: _marcelSupa,
      title: 'Quick Advice: Dealing with Flare-ups at Work',
      content:
          'For those who work in offices, here\'s what I do when I feel a flare-up coming:\n\n• Keep a cooling gel in the office fridge\n• Use a small fan at your desk\n• Wear loose, breathable clothes\n• Take short walks every hour\n• Stay hydrated (this is crucial!)\n\nWhat are your workplace coping strategies?',
      category: 'Advice',
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      commentCount: 9,
      likeCount: 14,
    ),
    Post(
      id: '10',
      author: _lisaRodriguez,
      title: 'Sometimes I Just Want to Hide',
      content:
          'Bad flare day. My face is red and irritated, and I just want to stay home and hide from the world. It\'s hard to explain to people who don\'t understand that sometimes your skin just hurts and you feel self-conscious about how you look. Thanks for being a safe space to share these feelings. 💙',
      category: 'Vent',
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      commentCount: 18,
      likeCount: 31,
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
    '4': [
      Comment(
        id: 'c4',
        author: _jamesWilson,
        content: 'This is amazing research! Mental health support is so important.',
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      Comment(
        id: 'c5',
        author: _lisaRodriguez,
        content: 'I\'d love to be part of this program. Where can I apply?',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ],
    '5': [
      Comment(
        id: 'c6',
        author: _emilyWalker,
        content: 'Great tips! The humidifier at work is a game changer.',
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
      Comment(
        id: 'c7',
        author: _sarahChen,
        content: 'These are excellent workplace strategies. Thanks for sharing!',
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ],
    '6': [
      Comment(
        id: 'c8',
        author: _emilyWalker,
        content: 'I totally understand. Parenting with this condition is so hard. You\'re doing great! 💙',
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      ),
      Comment(
        id: 'c9',
        author: _jamesWilson,
        content: 'Sending you virtual hugs. We all have those days.',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
    ],
    '7': [
      Comment(
        id: 'c10',
        author: _lisaRodriguez,
        content: 'This gives me so much hope! Congratulations on your success! 🎉',
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      Comment(
        id: 'c11',
        author: _jamesWilson,
        content: 'Amazing! What was the key factor that helped you most?',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ],
    '8': [
      Comment(
        id: 'c12',
        author: _emilyWalker,
        content: 'I\'d love to join! Count me in.',
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      ),
    ],
    '9': [
      Comment(
        id: 'c13',
        author: _sarahChen,
        content: 'Great advice! I also keep a small fan at my desk.',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
    ],
    '10': [
      Comment(
        id: 'c14',
        author: _emilyWalker,
        content: 'You\'re not alone. We all have those days. Take care of yourself 💙',
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      ),
      Comment(
        id: 'c15',
        author: _jamesWilson,
        content: 'I understand completely. This community is here for you.',
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
    ],
  };
}
