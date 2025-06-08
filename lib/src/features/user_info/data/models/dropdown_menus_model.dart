class DropdownMenusModel {
  final bool success;
  final Data data;

  DropdownMenusModel({
    required this.success,
    required this.data,
  });

  factory DropdownMenusModel.fromJson(Map<String, dynamic> json) =>
      DropdownMenusModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  final List<String> chronicDiseases;
  final List<String> environmentalAllergies;
  final List<String> familyMedicalConditions;
  final List<String> foodAllergies;
  final List<String> medicationAllergies;
  final List<String> previousSurgeries;
  final List<String> medicalSpecialties;
  final List<TreatmentPlanOption> treatmentPlanOptions;
  final List<String> medicalTestsCatalog;

  Data({
    required this.chronicDiseases,
    required this.environmentalAllergies,
    required this.familyMedicalConditions,
    required this.foodAllergies,
    required this.medicationAllergies,
    required this.previousSurgeries,
    required this.medicalSpecialties,
    required this.treatmentPlanOptions,
    required this.medicalTestsCatalog,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        chronicDiseases:
            List<String>.from(json["chronicDiseases"].map((x) => x)),
        environmentalAllergies:
            List<String>.from(json["environmentalAllergies"].map((x) => x)),
        familyMedicalConditions:
            List<String>.from(json["familyMedicalConditions"].map((x) => x)),
        foodAllergies: List<String>.from(json["foodAllergies"].map((x) => x)),
        medicationAllergies:
            List<String>.from(json["medicationAllergies"].map((x) => x)),
        previousSurgeries:
            List<String>.from(json["previousSurgeries"].map((x) => x)),
        medicalSpecialties:
            List<String>.from(json["medicalSpecialties"].map((x) => x)),
        treatmentPlanOptions: List<TreatmentPlanOption>.from(
            json["treatmentPlanOptions"]
                .map((x) => TreatmentPlanOption.fromJson(x))),
        medicalTestsCatalog:
            List<String>.from(json["medicalTestsCatalog"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "chronicDiseases": List<dynamic>.from(chronicDiseases.map((x) => x)),
        "environmentalAllergies":
            List<dynamic>.from(environmentalAllergies.map((x) => x)),
        "familyMedicalConditions":
            List<dynamic>.from(familyMedicalConditions.map((x) => x)),
        "foodAllergies": List<dynamic>.from(foodAllergies.map((x) => x)),
        "medicationAllergies":
            List<dynamic>.from(medicationAllergies.map((x) => x)),
        "previousSurgeries":
            List<dynamic>.from(previousSurgeries.map((x) => x)),
        "medicalSpecialties":
            List<dynamic>.from(medicalSpecialties.map((x) => x)),
        "treatmentPlanOptions":
            List<dynamic>.from(treatmentPlanOptions.map((x) => x.toJson())),
        "medicalTestsCatalog":
            List<dynamic>.from(medicalTestsCatalog.map((x) => x)),
      };
}

class TreatmentPlanOption {
  final String category;
  final String type;

  TreatmentPlanOption({
    required this.category,
    required this.type,
  });

  factory TreatmentPlanOption.fromJson(Map<String, dynamic> json) =>
      TreatmentPlanOption(
        category: json["category"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": type,
      };
}
