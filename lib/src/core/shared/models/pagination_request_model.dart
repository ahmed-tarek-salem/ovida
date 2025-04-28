class PaginationRequestModel {
  final int page;
  int? perPage;

  PaginationRequestModel({
    required this.page,
    this.perPage = 15,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
    };
  }
}
