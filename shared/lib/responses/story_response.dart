class StoriesResponse {

  final List<Story> stories;
  final Pagination pagination;

  StoriesResponse({
    required this.stories,
    required this.pagination,
  });

  factory StoriesResponse.fromJson(Map<String, dynamic> json) {
    return StoriesResponse(
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => Story.fromJson(e))
          .toList() ??
          [],
      pagination: Pagination.fromJson(json['pagination'] ?? {}),
    );
  }

}


class Story {
  final int id;
  final String title;
  final String imageUrl;
  final String ageRange;
  final bool isActive;
  final Category category;
  final Popularity popularity;
  final String createdAt;

  Story({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ageRange,
    required this.isActive,
    required this.category,
    required this.popularity,
    required this.createdAt,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      ageRange: json['ageRange'] ?? '',
      isActive: json['isActive'] ?? false,
      category: Category.fromJson(json['category'] ?? {}),
      popularity: Popularity.fromJson(json['popularity'] ?? {}),
      createdAt: json['createdAt'] ?? '',
    );
  }


}


class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class Popularity {
  final int inLibraries;
  final int favorites;

  Popularity({
    required this.inLibraries,
    required this.favorites,
  });

  factory Popularity.fromJson(Map<String, dynamic> json) {
    return Popularity(
      inLibraries: json['inLibraries'] ?? 0,
      favorites: json['favorites'] ?? 0,
    );
  }
}

class Pagination {
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final bool hasNext;
  final bool hasPrev;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    required this.hasNext,
    required this.hasPrev,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
      hasNext: json['hasNext'] ?? false,
      hasPrev: json['hasPrev'] ?? false,
    );
  }

}





