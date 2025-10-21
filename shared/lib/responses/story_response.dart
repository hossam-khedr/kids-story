class StoryResponse {
  final int id;
  final String title;
  final String description;
  final String content;
  final String image;
  final int categoryId;

  StoryResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.categoryId,
  });

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
    id: json['ID'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    content: json['content'] as String,
    image: json['image'] as String,
    categoryId: json['category_id'] as int,
  );
}
