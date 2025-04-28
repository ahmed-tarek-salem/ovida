class ItemModel {
  final int id;
  final String name;
  ItemModel({
    required this.id,
    required this.name,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
