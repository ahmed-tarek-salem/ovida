class AppEndpoints {
  static const String login = '/outdoor/login';
  static const String addLead = '/outdoor/lead/store';
  static const String getCities = '/cities';
  static const String getPharmacies = '/outdoor/pharmacies';
  static String getPharmacy(int pharmacyId) =>
      '/outdoor/lead/pharmacy/$pharmacyId';
  static String postCommunicationLog(int pharmacyId) =>
      '/outdoor/lead/pharmacy/$pharmacyId/communication-logs';
}
