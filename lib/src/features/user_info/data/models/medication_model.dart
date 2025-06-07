class MedicationModel {
  final String id;
  final String? brandName;

  MedicationModel({
    required this.id,
    required this.brandName,
  });

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>
      MedicationModel(
        id: json["_id"],
        brandName: json["brandName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "brandName": brandName,
      };
}
