import '../models/user.dart';

class SettingsData {
  static final MedicalInfo currentUserMedicalInfo = MedicalInfo(
    conditions: 'Type 1 Diabetes',
    dateOfDiagnosis: '2024-01-01',
    centerOfDiagnosis: 'San Francisco',
    treatmentCenter: 'San Francisco',
    involvementInClinicalTrial: true,
  );
}
