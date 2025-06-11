class DosesModel {
  final List<Dose>? previousDoses;
  final Dose? nextDose;

  DosesModel({
    this.previousDoses,
    this.nextDose,
  });

  factory DosesModel.fromJson(Map<String, dynamic> json) {
    try {
      return DosesModel(
        previousDoses: json["previousDoses"] != null
            ? List<Dose>.from((json["previousDoses"] as List<dynamic>)
                .map((x) => Dose.fromJson(x as Map<String, dynamic>))
                .where((dose) => dose != null))
            : null,
        nextDose: json["nextDose"] != null
            ? Dose.fromJson(json["nextDose"] as Map<String, dynamic>)
            : null,
      );
    } catch (e) {
      print('Error parsing DosesModel: $e');
      return DosesModel(previousDoses: null, nextDose: null);
    }
  }
}

class Dose {
  final String? id;
  final Medication? medication;
  final DateTime? notificationTime;
  final bool? sent;
  final bool? canceled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Dose({
    this.id,
    this.medication,
    this.notificationTime,
    this.sent,
    this.canceled,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Dose.fromJson(Map<String, dynamic> json) {
    try {
      return Dose(
        id: json["_id"]?.toString(),
        medication: json["medication"] != null
            ? Medication.fromJson(json["medication"] as Map<String, dynamic>)
            : null,
        notificationTime: json["notificationTime"] != null
            ? DateTime.tryParse(json["notificationTime"].toString())
            : null,
        sent: json["sent"] as bool?,
        canceled: json["canceled"] as bool?,
        createdAt: json["createdAt"] != null
            ? DateTime.tryParse(json["createdAt"].toString())
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.tryParse(json["updatedAt"].toString())
            : null,
        v: json["__v"] as int?,
      );
    } catch (e) {
      print('Error parsing Dose: $e');
      return Dose();
    }
  }
}

class Medication {
  final String? id;
  final MedicationDetails? medicationDetails;
  final String? dosage;
  final String? frequency;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? prescribingDoctor;
  final String? user;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Medication({
    this.id,
    this.medicationDetails,
    this.dosage,
    this.frequency,
    this.startDate,
    this.endDate,
    this.prescribingDoctor,
    this.user,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    try {
      return Medication(
        id: json["_id"]?.toString(),
        medicationDetails: json["medication"] != null
            ? MedicationDetails.fromJson(
                json["medication"] as Map<String, dynamic>)
            : null,
        dosage: json["dosage"]?.toString(),
        frequency: json["frequency"]?.toString(),
        startDate: json["startDate"] != null
            ? DateTime.tryParse(json["startDate"].toString())
            : null,
        endDate: json["endDate"] != null
            ? DateTime.tryParse(json["endDate"].toString())
            : null,
        prescribingDoctor: json["prescribingDoctor"]?.toString(),
        user: json["user"]?.toString(),
        isActive: json["isActive"] as bool?,
        createdAt: json["createdAt"] != null
            ? DateTime.tryParse(json["createdAt"].toString())
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.tryParse(json["updatedAt"].toString())
            : null,
        v: json["__v"] as int?,
      );
    } catch (e) {
      print('Error parsing Medication: $e');
      return Medication();
    }
  }
}

class MedicationDetails {
  final String? id;
  final String? brandName;
  final String? genericName;
  final String? drugClass;
  final List<String>? indications;
  final List<String>? contraindications;
  final String? recommendedDosage;
  final String? routeOfAdministration;
  final List<String>? commonSideEffects;
  final List<String>? seriousAdverseEffects;
  final List<String>? drugInteractions;
  final String? storageAndHandling;
  final String? pregnancyAndLactationSafety;
  final String? hepatic;
  final String? kidney;
  final int? v;

  MedicationDetails({
    this.id,
    this.brandName,
    this.genericName,
    this.drugClass,
    this.indications,
    this.contraindications,
    this.recommendedDosage,
    this.routeOfAdministration,
    this.commonSideEffects,
    this.seriousAdverseEffects,
    this.drugInteractions,
    this.storageAndHandling,
    this.pregnancyAndLactationSafety,
    this.hepatic,
    this.kidney,
    this.v,
  });

  factory MedicationDetails.fromJson(Map<String, dynamic> json) {
    try {
      return MedicationDetails(
        id: json["_id"]?.toString(),
        brandName: json["brandName"]?.toString(),
        genericName: json["genericName"]?.toString(),
        drugClass: json["drugClass"]?.toString(),
        indications: json["indications"] != null
            ? List<String>.from(json["indications"] as List<dynamic>)
            : null,
        contraindications: json["contraindications"] != null
            ? List<String>.from(json["contraindications"] as List<dynamic>)
            : null,
        recommendedDosage: json["recommendedDosage"]?.toString(),
        routeOfAdministration: json["routeOfAdministration"]?.toString(),
        commonSideEffects: json["commonSideEffects"] != null
            ? List<String>.from(json["commonSideEffects"] as List<dynamic>)
            : null,
        seriousAdverseEffects: json["seriousAdverseEffects"] != null
            ? List<String>.from(json["seriousAdverseEffects"] as List<dynamic>)
            : null,
        drugInteractions: json["drugInteractions"] != null
            ? List<String>.from(json["drugInteractions"] as List<dynamic>)
            : null,
        storageAndHandling: json["storageAndHandling"]?.toString(),
        pregnancyAndLactationSafety:
            json["pregnancyAndLactationSafety"]?.toString(),
        hepatic: json["hepatic"]?.toString(),
        kidney: json["kidney"]?.toString(),
        v: json["__v"] as int?,
      );
    } catch (e) {
      print('Error parsing MedicationDetails: $e');
      return MedicationDetails();
    }
  }
}
