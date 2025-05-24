class UserInfoResponse {
  final User? user;

  UserInfoResponse({
    this.user,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      UserInfoResponse(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  final String? id;
  final String? phoneNumber;
  final String? email;
  final String? gender;
  final Address? address;
  final EmergencyContact? emergencyContact;
  final List<String>? chronicDiseases;
  final List<String>? allergies;
  final List<String>? previousSurgeries;
  final List<String>? familyMedicalHistory;

  User({
    this.id,
    this.phoneNumber,
    this.email,
    this.gender,
    this.address,
    this.emergencyContact,
    this.chronicDiseases,
    this.allergies,
    this.previousSurgeries,
    this.familyMedicalHistory,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        gender: json["gender"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        emergencyContact: json["emergencyContact"] == null
            ? null
            : EmergencyContact.fromJson(json["emergencyContact"]),
        chronicDiseases: json["chronicDiseases"] == null
            ? []
            : List<String>.from(json["chronicDiseases"]!.map((x) => x)),
        allergies: json["allergies"] == null
            ? []
            : List<String>.from(json["allergies"]!.map((x) => x)),
        previousSurgeries: json["previousSurgeries"] == null
            ? []
            : List<String>.from(json["previousSurgeries"]!.map((x) => x)),
        familyMedicalHistory: json["familyMedicalHistory"] == null
            ? []
            : List<String>.from(json["familyMedicalHistory"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": gender,
        "address": address?.toJson(),
        "emergencyContact": emergencyContact?.toJson(),
        "chronicDiseases": chronicDiseases == null
            ? []
            : List<dynamic>.from(chronicDiseases!.map((x) => x)),
        "allergies": allergies == null
            ? []
            : List<dynamic>.from(allergies!.map((x) => x)),
        "previousSurgeries": previousSurgeries == null
            ? []
            : List<dynamic>.from(previousSurgeries!.map((x) => x)),
        "familyMedicalHistory": familyMedicalHistory == null
            ? []
            : List<dynamic>.from(familyMedicalHistory!.map((x) => x)),
      };
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;

  Address({
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "country": country,
      };
}

class EmergencyContact {
  final String? name;
  final String? relationship;
  final String? phoneNumber;

  EmergencyContact({
    this.name,
    this.relationship,
    this.phoneNumber,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      EmergencyContact(
        name: json["name"],
        relationship: json["relationship"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "relationship": relationship,
        "phoneNumber": phoneNumber,
      };
}
