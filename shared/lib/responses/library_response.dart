class LibraryResponse {
  final int id;
  final String title;
  final String image;
  final String? description;
  final double progress;
  final String createdAt;

  LibraryResponse({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.progress,
    required this.createdAt,
  });

  factory LibraryResponse.fromJson(Map<String, dynamic> json) =>
      LibraryResponse(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        description: json['description'],
        progress: json['progress'],
        createdAt: json['created_at'],
      );
}


