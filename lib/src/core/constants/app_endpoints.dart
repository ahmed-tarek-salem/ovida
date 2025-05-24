class AppEndpoints {
  static const String signup = '/auth/signup';
  static const String login = '/auth/login';
  static const String getUserInfo = '/auth/profile';
  static String getPharmacy(int pharmacyId) =>
      '/outdoor/lead/pharmacy/$pharmacyId';
}
