class FileResponeModel {
  final int? id;
  final String? name;
  final String? type;
  final String? url;

  FileResponeModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.url});

  factory FileResponeModel.fromJson(Map<String, dynamic> json) {
    return FileResponeModel(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      url: json["url"],
    );
  }
}
