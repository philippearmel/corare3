/// Legacy UserProfile class for backward compatibility
class UserProfile {
  final String fullName;
  final String bio;
  final String avatar;
  final String gender;
  final String location;

  const UserProfile({
    required this.fullName,
    required this.bio,
    required this.avatar,
    required this.gender,
    required this.location,
  });
}
