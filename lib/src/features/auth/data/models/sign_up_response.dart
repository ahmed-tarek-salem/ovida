import 'package:ovida/src/features/auth/data/models/user_model.dart';

class SignUpResponse {
  final String message;
  final String token;
  final UserModel user;

  SignUpResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'] as String,
      token: json['token'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'user': user.toJson(),
    };
  }

  @override
  String toString() =>
      'SignUpResponse(message: $message, token: $token, user: $user)';
}
