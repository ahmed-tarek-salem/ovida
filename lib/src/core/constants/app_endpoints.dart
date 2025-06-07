class AppEndpoints {
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String getUserInfo = '/auth/profile';
  static const String updateProfile = '/auth/profile/update';
  static const String getDropdownData = '/drop-down-lists';
  static const String getMedications = '/medicine/medicines/brand-names';
  static String getPharmacy(int pharmacyId) =>
      '/outdoor/lead/pharmacy/$pharmacyId';
}
