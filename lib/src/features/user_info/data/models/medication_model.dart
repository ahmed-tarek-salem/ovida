class MedicationModel {
  final String id;
  final String? brandName;
  final String? genericName;
  final String? drugClass;
  final List<String> indications;
  final List<String> contraindications;
  final String? recommendedDosage;
  final String? routeOfAdministration;
  final List<String> commonSideEffects;
  final List<String> seriousAdverseEffects;
  final List<String> drugInteractions;
  final String? storageAndHandling;
  final String? pregnancyAndLactationSafety;
  final String? hepatic;
  final String? kidney;
  final int v;

  MedicationModel({
    required this.id,
    required this.brandName,
    required this.genericName,
    required this.drugClass,
    required this.indications,
    required this.contraindications,
    required this.recommendedDosage,
    required this.routeOfAdministration,
    required this.commonSideEffects,
    required this.seriousAdverseEffects,
    required this.drugInteractions,
    required this.storageAndHandling,
    required this.pregnancyAndLactationSafety,
    required this.hepatic,
    required this.kidney,
    required this.v,
  });

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      MedicationModel(
        id: json["_id"],
        brandName: json["brandName"],
        genericName: json["genericName"],
        drugClass: json["drugClass"],
        indications: List<String>.from(json["indications"].map((x) => x)),
        contraindications:
            List<String>.from(json["contraindications"].map((x) => x)),
        recommendedDosage: json["recommendedDosage"],
        routeOfAdministration: json["routeOfAdministration"],
        commonSideEffects:
            List<String>.from(json["commonSideEffects"].map((x) => x)),
        seriousAdverseEffects:
            List<String>.from(json["seriousAdverseEffects"].map((x) => x)),
        drugInteractions:
            List<String>.from(json["drugInteractions"].map((x) => x)),
        storageAndHandling: json["storageAndHandling"],
        pregnancyAndLactationSafety: json["pregnancyAndLactationSafety"],
        hepatic: json["hepatic"],
        kidney: json["kidney"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "brandName": brandName,
        "genericName": genericName,
        "drugClass": drugClass,
        "indications": List<dynamic>.from(indications.map((x) => x)),
        "contraindications":
            List<dynamic>.from(contraindications.map((x) => x)),
        "recommendedDosage": recommendedDosage,
        "routeOfAdministration": routeOfAdministration,
        "commonSideEffects":
            List<dynamic>.from(commonSideEffects.map((x) => x)),
        "seriousAdverseEffects":
            List<dynamic>.from(seriousAdverseEffects.map((x) => x)),
        "drugInteractions": List<dynamic>.from(drugInteractions.map((x) => x)),
        "storageAndHandling": storageAndHandling,
        "pregnancyAndLactationSafety": pregnancyAndLactationSafety,
        "hepatic": hepatic,
        "kidney": kidney,
        "__v": v,
      };
}
