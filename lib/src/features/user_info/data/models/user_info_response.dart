class UserInfoResponse {
  final User user;
  final List<CurrentMedication> currentMedications;
  final List<LaboratoryReport> laboratoryReports;
  final List<MedicalVisit> medicalVisits;
  final List<VitalSign> vitalSigns;

  UserInfoResponse({
    required this.user,
    required this.currentMedications,
    required this.laboratoryReports,
    required this.medicalVisits,
    required this.vitalSigns,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      UserInfoResponse(
        user: User.fromJson(json["user"]),
        currentMedications: json["currentMedications"] == null
            ? []
            : List<CurrentMedication>.from(json["currentMedications"]
                .map((x) => CurrentMedication.fromJson(x))),
        laboratoryReports: json["laboratoryReports"] == null
            ? []
            : List<LaboratoryReport>.from(json["laboratoryReports"]
                .map((x) => LaboratoryReport.fromJson(x))),
        medicalVisits: json["medicalVisits"] == null
            ? []
            : List<MedicalVisit>.from(
                json["medicalVisits"].map((x) => MedicalVisit.fromJson(x))),
        vitalSigns: json["vitalSigns"] == null
            ? []
            : List<VitalSign>.from(
                json["vitalSigns"].map((x) => VitalSign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "currentMedications":
            List<dynamic>.from(currentMedications.map((x) => x.toJson())),
        "laboratoryReports":
            List<dynamic>.from(laboratoryReports.map((x) => x.toJson())),
        "medicalVisits":
            List<dynamic>.from(medicalVisits.map((x) => x.toJson())),
        "vitalSigns": List<dynamic>.from(vitalSigns.map((x) => x.toJson())),
      };

  UserInfoResponse copyWith({
    User? user,
    List<CurrentMedication>? currentMedications,
    List<LaboratoryReport>? laboratoryReports,
    List<MedicalVisit>? medicalVisits,
    List<VitalSign>? vitalSigns,
  }) {
    return UserInfoResponse(
      user: user ?? this.user,
      currentMedications: currentMedications ?? this.currentMedications,
      laboratoryReports: laboratoryReports ?? this.laboratoryReports,
      medicalVisits: medicalVisits ?? this.medicalVisits,
      vitalSigns: vitalSigns ?? this.vitalSigns,
    );
  }
}

class CurrentMedication {
  final String? id;
  final String? medication;
  final String? dosage;
  final String? frequency;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? prescribingDoctor;
  final String? user;
  final bool? isActive;
  final int? v;

  CurrentMedication({
    required this.id,
    required this.medication,
    required this.dosage,
    required this.frequency,
    required this.startDate,
    required this.endDate,
    required this.prescribingDoctor,
    this.user,
    this.isActive,
    this.v,
  });

  factory CurrentMedication.fromJson(Map<String, dynamic> json) =>
      CurrentMedication(
        id: json["_id"],
        medication: json["medication"],
        dosage: json["dosage"],
        frequency: json["frequency"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        prescribingDoctor: json["prescribingDoctor"],
        user: json["user"],
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "medication": id,
        "dosage": dosage,
        "frequency": frequency,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "prescribingDoctor": prescribingDoctor,
      };
}

class LaboratoryReport {
  final String? id;
  final String? testType;
  final DateTime? testDate;
  final String? resultsSummary;
  final String? user;
  final int? v;

  LaboratoryReport({
    this.id,
    required this.testType,
    required this.testDate,
    required this.resultsSummary,
    this.user,
    this.v,
  });

  factory LaboratoryReport.fromJson(Map<String, dynamic> json) =>
      LaboratoryReport(
        id: json["_id"],
        testType: json["testType"],
        testDate: DateTime.parse(json["testDate"]),
        resultsSummary: json["resultsSummary"],
        user: json["user"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "testType": testType,
        "testDate": testDate?.toIso8601String(),
        "resultsSummary": resultsSummary,
      };
}

class MedicalVisit {
  final HealthcareProvider? healthcareProvider;
  final TreatmentPlan? treatmentPlan;
  final String? id;
  final String? subject;
  final DateTime? dateOfVisit;
  final String? diagnosis;
  final String? user;
  final int? v;

  MedicalVisit({
    required this.healthcareProvider,
    required this.treatmentPlan,
    required this.subject,
    required this.dateOfVisit,
    required this.diagnosis,
    this.id,
    this.user,
    this.v,
  });

  factory MedicalVisit.fromJson(Map<String, dynamic> json) => MedicalVisit(
        healthcareProvider: json["healthcareProvider"] == null
            ? null
            : HealthcareProvider.fromJson(json["healthcareProvider"]),
        treatmentPlan: json["treatmentPlan"] == null
            ? null
            : TreatmentPlan.fromJson(json["treatmentPlan"]),
        id: json["_id"],
        subject: json["subject"],
        dateOfVisit: json["dateOfVisit"] == null
            ? null
            : DateTime.parse(json["dateOfVisit"]),
        diagnosis: json["diagnosis"],
        user: json["user"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "healthcareProvider": healthcareProvider?.toJson(),
        "treatmentPlan": treatmentPlan?.toJson(),
        "subject": subject,
        "dateOfVisit": dateOfVisit?.toIso8601String(),
        "diagnosis": diagnosis,
      };
}

class HealthcareProvider {
  final String? name;
  final String? specialization;

  HealthcareProvider({
    required this.name,
    this.specialization,
  });

  factory HealthcareProvider.fromJson(Map<String, dynamic> json) =>
      HealthcareProvider(
        name: json["name"],
        specialization: json["specialization"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        //"specialization": specialization,
      };
}

class TreatmentPlan {
  final String description;
  // final String duration;
  // final DateTime followUpDate;

  TreatmentPlan({
    required this.description,
    // required this.duration,
    // required this.followUpDate,
  });

  factory TreatmentPlan.fromJson(Map<String, dynamic> json) => TreatmentPlan(
        description: json["description"],
        // duration: json["duration"],
        // followUpDate: DateTime.parse(json["followUpDate"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        // "duration": duration,
        // "followUpDate": followUpDate.toIso8601String(),
      };
}

class User {
  final Address? address;
  final EmergencyContact? emergencyContact;
  final String? id;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? alternativeContact;
  final List<String> chronicDiseases;
  final List<String> allergies;
  final List<String> previousSurgeries;
  final List<String> familyMedicalHistory;
  // final List<dynamic> fcmTokens;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final int? v;

  User({
    required this.address,
    required this.emergencyContact,
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.alternativeContact,
    required this.chronicDiseases,
    required this.allergies,
    required this.previousSurgeries,
    required this.familyMedicalHistory,
    // required this.fcmTokens,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        emergencyContact: json["emergencyContact"] == null
            ? null
            : EmergencyContact.fromJson(json["emergencyContact"]),
        id: json["_id"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        gender: json["gender"],
        alternativeContact: json["alternativeContact"],
        chronicDiseases: json["chronicDiseases"] == null
            ? []
            : List<String>.from(json["chronicDiseases"].map((x) => x)),
        allergies: json["allergies"] == null
            ? []
            : List<String>.from(json["allergies"].map((x) => x)),
        previousSurgeries: json["previousSurgeries"] == null
            ? []
            : List<String>.from(json["previousSurgeries"].map((x) => x)),
        familyMedicalHistory: json["familyMedicalHistory"] == null
            ? []
            : List<String>.from(json["familyMedicalHistory"].map((x) => x)),
        // fcmTokens: List<dynamic>.from(json["fcmTokens"].map((x) => x)),
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "emergencyContact": emergencyContact?.toJson(),
        "_id": id,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "gender": gender,
        "alternativeContact": alternativeContact,
        "chronicDiseases": List<dynamic>.from(chronicDiseases.map((x) => x)),
        "allergies": List<dynamic>.from(allergies.map((x) => x)),
        "previousSurgeries":
            List<dynamic>.from(previousSurgeries.map((x) => x)),
        "familyMedicalHistory":
            List<dynamic>.from(familyMedicalHistory.map((x) => x)),
        "__v": v,
      };
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
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
    required this.name,
    required this.relationship,
    required this.phoneNumber,
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

class VitalSign {
  final BloodPressure? bloodPressure;
  final String? id;
  final int? heartRate;
  final int? bloodGlucoseLevel;
  final String? user;
  final int? v;

  VitalSign({
    required this.bloodPressure,
    this.id,
    required this.heartRate,
    required this.bloodGlucoseLevel,
    this.user,
    this.v,
  });

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
        bloodPressure: json["bloodPressure"] == null
            ? null
            : BloodPressure.fromJson(json["bloodPressure"]),
        id: json["_id"],
        heartRate: json["heartRate"],
        bloodGlucoseLevel: json["bloodGlucoseLevel"],
        user: json["user"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "bloodPressure": bloodPressure?.toJson(),
        "heartRate": heartRate,
        "bloodGlucoseLevel": bloodGlucoseLevel,
      };
}

class BloodPressure {
  final int? systolic;
  final int? diastolic;

  BloodPressure({
    required this.systolic,
    required this.diastolic,
  });

  factory BloodPressure.fromJson(Map<String, dynamic> json) => BloodPressure(
        systolic: json["systolic"],
        diastolic: json["diastolic"],
      );

  Map<String, dynamic> toJson() => {
        "systolic": systolic,
        "diastolic": diastolic,
      };
}
