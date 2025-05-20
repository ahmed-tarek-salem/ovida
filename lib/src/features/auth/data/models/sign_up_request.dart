class SignUpRequest {
  final String password;
  final String phoneNumber;

  SignUpRequest({
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'phoneNumber': phoneNumber,
    };
  }
}
