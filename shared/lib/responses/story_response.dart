class StoryResponse {
  final int id;
  final String title;
  final String image;
  final String? description;
  final String content;

  final int categoryId;
  final String createdAd;

  StoryResponse( {
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.content,
    required this.categoryId,
    required this.createdAd,
  });

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
    id: json['id'] as int,
    title: json['title'] as String,
    image: json['image'] as String,
    description: json['description']?.toString()??"No Descrrition",
    content: json['content'] as String,
    categoryId: json['category_id'] as int,
    createdAd: json['created_at'] as String,
  );
}


