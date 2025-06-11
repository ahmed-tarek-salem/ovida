class DosesModel {
  final List<Dose>? previousDoses;
  final Dose? nextDose;

  DosesModel({
    required this.previousDoses,
    required this.nextDose,
  });

  factory DosesModel.fromJson(Map<String, dynamic> json) => DosesModel(
        previousDoses: json["previousDoses"] == null
            ? null
            : List<Dose>.from(
                json["previousDoses"].map((x) => Dose.fromJson(x))),
        nextDose:
            json["nextDose"] == null ? null : Dose.fromJson(json["nextDose"]),
      );
}

class Dose {
  final String id;
  final Medication medication;
  final DateTime notificationTime;
  final bool sent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Dose({
    required this.id,
    required this.medication,
    required this.notificationTime,
    required this.sent,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Dose.fromJson(Map<String, dynamic> json) => Dose(
        id: json["_id"],
        medication: Medication.fromJson(json["medication"]),
        notificationTime: DateTime.parse(json["notificationTime"]),
        sent: json["sent"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class Medication {
  final String id;
  final dynamic medication;
  final String? dosage;
  final String? frequency;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? prescribingDoctor;
  final String? user;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Medication({
    required this.id,
    required this.medication,
    required this.dosage,
    required this.frequency,
    required this.startDate,
    required this.endDate,
    required this.prescribingDoctor,
    required this.user,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        id: json["_id"],
        medication: json["medication"],
        dosage: json["dosage"],
        frequency: json["frequency"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        prescribingDoctor: json["prescribingDoctor"],
        user: json["user"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}
