class AppEndpoints {
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String fcmToken = '/auth/fcm-token';
  static const String getUserInfo = '/auth/profile';
  static const String updateUserInfo = '/auth/profile';
  static const String getDropdownData = '/drop-down-lists';
  static const String getMedications = '/medicine/medicines/brand-names';
  static const String getDoses = '/current-medications/doses';

  static String getPharmacy(int pharmacyId) =>
      '/outdoor/lead/pharmacy/$pharmacyId';
}
