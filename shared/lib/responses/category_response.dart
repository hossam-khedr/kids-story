class CategoryResponse {
  final int id;
  final int storiesCount;
  final String name;
  final String createdAt;
  final String image;
  final String description;


  CategoryResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.storiesCount,
    required this.createdAt,

  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'],
        image: json['imageUrl'] as String,
        storiesCount: json['storiesCount'] as int,
        createdAt: json['createdAt'] as String,

      );
}

class PaginationResponse {
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final bool hasNext;
  final bool hasPrev;

  PaginationResponse({
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    required this.hasNext,
    required this.hasPrev,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      PaginationResponse(
        currentPage: json['currentPage'],
        totalPages: json['totalPages'],
        totalCount: json['totalCount'],
        hasNext: json['hasNext'],
        hasPrev: json['hasPrev'],
      );
}
