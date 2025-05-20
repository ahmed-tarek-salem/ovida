class UserModel {
  final String id;
  final String phoneNumber;
  final String? token;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'token': token,
    };
  }

  UserModel copyWith({
    String? id,
    String? phoneNumber,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      token: token ?? this.token,
    );
  }

  @override
  String toString() =>
      'UserModel(id: $id, phoneNumber: $phoneNumber, token: $token)';
}
