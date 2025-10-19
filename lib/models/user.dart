class User {
  final String id;
  final String name;
  final String? avatar;
  final String? location;
  final String? organization;
  final String? bio;
  final String? condition;
  final String? diagnosedSince;
  final String memberSince;
  final bool isOnline;
  final String? ageRange;
  final String? gender;
  final List<String>? interests;

  User({
    required this.id,
    required this.name,
    this.avatar,
    this.location,
    this.organization,
    this.bio,
    this.condition,
    this.diagnosedSince,
    required this.memberSince,
    this.isOnline = false,
    this.ageRange,
    this.gender,
    this.interests,
  });
}

class MedicalInfo {
  final String? conditions;
  final String? dateOfDiagnosis;
  final String? centerOfDiagnosis;
  final String? treatmentCenter;
  final bool? involvementInClinicalTrial;

  MedicalInfo({
    this.conditions,
    this.dateOfDiagnosis,
    this.centerOfDiagnosis,
    this.treatmentCenter,
    this.involvementInClinicalTrial,
  });
}
