import '../models/user.dart';
import '../models/user_profile.dart';

/// Unified user data class that combines user profile and current user information
class UserData {
  static const String personalInfoSectionTitle = 'Personal Information';

  /// Current logged-in user with complete profile information
  static final User currentUser = User(
    id: 'current',
    name: 'Philippe N\'techobo',
    avatar:
        'https://scontent-cdg4-1.xx.fbcdn.net/v/t1.6435-9/167855748_10220079541799096_4530052258888697993_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=6X5hFbHQr58Q7kNvwEVNL8q&_nc_oc=AdnNZTqjC3FO-4HAMSAiMwgGw0DblIqUKJb5HLgBTmmiTJp5Nkg0xFcsnZqKDjJNoIY74J30C-uAw8Fn0WS2-pvb&_nc_zt=23&_nc_ht=scontent-cdg4-1.xx&_nc_gid=2kKDorstF8Z5k6yrxZOoEQ&oh=00_AffGFSsIbVjVlPQqTDQexyK-Zv7uPyCEnxEKinYzol_Msw&oe=690D117C',
    location: 'San Francisco',
    bio: 'Health advocate and community supporter',
    gender: 'Male',
    memberSince: '2 months',
    isOnline: true,
  );

  /// Legacy UserProfile class for backward compatibility
  static const UserProfile currentUserProfile = UserProfile(
    fullName: 'Philippe N\'techobo',
    bio: 'Health advocate and community supporter',
    avatar:
        'https://scontent-cdg4-1.xx.fbcdn.net/v/t1.6435-9/167855748_10220079541799096_4530052258888697993_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=6X5hFbHQr58Q7kNvwEVNL8q&_nc_oc=AdnNZTqjC3FO-4HAMSAiMwgGw0DblIqUKJb5HLgBTmmiTJp5Nkg0xFcsnZqKDjJNoIY74J30C-uAw8Fn0WS2-pvb&_nc_zt=23&_nc_ht=scontent-cdg4-1.xx&_nc_gid=2kKDorstF8Z5k6yrxZOoEQ&oh=00_AffGFSsIbVjVlPQqTDQexyK-Zv7uPyCEnxEKinYzol_Msw&oe=690D117C',
    gender: 'Male',
    location: 'San Francisco',
  );
}
